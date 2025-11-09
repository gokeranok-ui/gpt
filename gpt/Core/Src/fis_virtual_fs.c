#include "fis_virtual_fs.h"

#define FIS_MEMFILE_ENABLE_OVERRIDES
#include "memfile.h"

#include <string.h>

#include "fis_blob.h"
#include "opkene_data.h"

#ifndef FIS_VIRTUAL_FILENAME
#define FIS_VIRTUAL_FILENAME "fismat.fis"
#endif

#ifndef FIS_MEMFILE_SLOT_COUNT
#define FIS_MEMFILE_SLOT_COUNT 4
#endif

static FISMemFile s_slots[FIS_MEMFILE_SLOT_COUNT];

static FILE *memfile_allocate_slot(void)
{
    for (int i = 0; i < FIS_MEMFILE_SLOT_COUNT; ++i) {
        if (!s_slots[i].in_use) {
            s_slots[i].in_use   = true;
            s_slots[i].buffer   = NULL;
            s_slots[i].length   = 0U;
            s_slots[i].position = 0U;
            return &s_slots[i];
        }
    }
    return NULL;
}

void memfile_table_init(void)
{
    for (int i = 0; i < FIS_MEMFILE_SLOT_COUNT; ++i) {
        s_slots[i].buffer   = NULL;
        s_slots[i].length   = 0U;
        s_slots[i].position = 0U;
        s_slots[i].in_use   = false;
    }
}

FILE *memfile_acquire_slot(int slot)
{
    if ((slot >= 0) && (slot < FIS_MEMFILE_SLOT_COUNT)) {
        if (!s_slots[slot].in_use) {
            s_slots[slot].in_use   = true;
            s_slots[slot].buffer   = NULL;
            s_slots[slot].length   = 0U;
            s_slots[slot].position = 0U;
        }
        return &s_slots[slot];
    }
    return memfile_allocate_slot();
}

FILE *memfile_get_slot(int slot)
{
    if ((slot >= 0) && (slot < FIS_MEMFILE_SLOT_COUNT) && s_slots[slot].in_use) {
        return &s_slots[slot];
    }
    return NULL;
}

void memfile_release_slot(int slot)
{
    if ((slot >= 0) && (slot < FIS_MEMFILE_SLOT_COUNT)) {
        s_slots[slot].buffer   = NULL;
        s_slots[slot].length   = 0U;
        s_slots[slot].position = 0U;
        s_slots[slot].in_use   = false;
    }
}

void memfile_attach(FILE *stream, const uint8_t *buffer, size_t length)
{
    if (stream == NULL) {
        return;
    }
    stream->buffer   = buffer;
    stream->length   = (buffer != NULL) ? length : 0U;
    stream->position = 0U;
}

size_t fis_mem_fread(void *ptr, size_t size, size_t nmemb, FILE *stream)
{
    if ((ptr == NULL) || (stream == NULL) || (size == 0U) || (nmemb == 0U)) {
        return 0U;
    }

    size_t requested_bytes = size * nmemb;
    if (stream->position >= stream->length) {
        return 0U;
    }

    size_t remaining = stream->length - stream->position;
    if (requested_bytes > remaining) {
        requested_bytes = remaining;
    }

    memcpy(ptr, &stream->buffer[stream->position], requested_bytes);
    stream->position += requested_bytes;

    return size ? (requested_bytes / size) : 0U;
}

int fis_mem_feof(const FILE *stream)
{
    if (stream == NULL) {
        return 1;
    }
    return (stream->position >= stream->length) ? 1 : 0;
}

void fis_mem_frewind(FILE *stream)
{
    if (stream != NULL) {
        stream->position = 0U;
    }
}

int fis_mem_fclose(FILE *stream)
{
    if (stream == NULL) {
        return 0;
    }
    stream->buffer   = NULL;
    stream->length   = 0U;
    stream->position = 0U;
    stream->in_use   = false;
    return 0;
}

static int move_position(FILE *stream, long offset, int origin, size_t *dest)
{
    size_t base = 0U;
    if (stream == NULL) {
        return 0;
    }

    switch (origin) {
    case SEEK_SET:
        base = 0U;
        break;
    case SEEK_CUR:
        base = stream->position;
        break;
    case SEEK_END:
        base = stream->length;
        break;
    default:
        return 0;
    }

    long target = (long)base + offset;
    if (target < 0L) {
        return 0;
    }

    size_t clamped = (size_t)target;
    if (clamped > stream->length) {
        return 0;
    }

    *dest = clamped;
    return 1;
}

int fis_mem_fseek(FILE *stream, long offset, int origin)
{
    size_t new_pos = 0U;
    if (!move_position(stream, offset, origin, &new_pos)) {
        return -1;
    }
    stream->position = new_pos;
    return 0;
}

long fis_mem_ftell(const FILE *stream)
{
    if (stream == NULL) {
        return -1L;
    }
    return (long)stream->position;
}

static const char g_virtual_filename[] = FIS_VIRTUAL_FILENAME;

void fis_virtual_fs_init(void)
{
    memfile_table_init();
}

void fis_virtual_fs_reset(void)
{
    for (int i = 0; i < 20; ++i) {
        if (eml_openfiles[i] != NULL) {
            fis_mem_fclose(eml_openfiles[i]);
            eml_openfiles[i] = NULL;
            eml_autoflush[i] = false;
        }
    }
    memfile_table_init();
}

FILE *fis_virtual_fs_open_blob(void)
{
    FILE *stream = memfile_acquire_slot(-1);
    if (stream != NULL) {
        memfile_attach(stream, g_fis_blob, g_fis_blob_len);
    }
    return stream;
}

void fis_virtual_fs_close_blob(FILE *stream)
{
    if (stream == NULL) {
        return;
    }

    for (int i = 0; i < 20; ++i) {
        if (eml_openfiles[i] == stream) {
            eml_openfiles[i] = NULL;
            eml_autoflush[i] = false;
        }
    }

    fis_mem_fclose(stream);
}

static boolean_T filename_matches(const emxArray_char_T *cfilename)
{
    if (cfilename == NULL) {
        return false;
    }

    int expected_len = (int)strlen(g_virtual_filename);
    if (cfilename->size[1] != expected_len) {
        return false;
    }

    for (int i = 0; i < expected_len; ++i) {
        if ((char)cfilename->data[i] != g_virtual_filename[i]) {
            return false;
        }
    }

    return true;
}

static signed char install_stream(FILE *stream)
{
    for (int idx = 0; idx < 20; ++idx) {
        if (eml_openfiles[idx] == NULL) {
            eml_openfiles[idx] = stream;
            eml_autoflush[idx] = false;

            int fileid = idx + 3;
            if (fileid > 127) {
                fileid = 127;
            }
            return (signed char)fileid;
        }
    }

    return -1;
}

boolean_T fis_virtual_fs_cfopen(const emxArray_char_T *cfilename,
                                const char *cpermission,
                                signed char *fileid_out)
{
    if ((cpermission == NULL) || (fileid_out == NULL)) {
        return false;
    }

    if ((cpermission[0] != 'r') || !filename_matches(cfilename)) {
        return false;
    }

    FILE *stream = fis_virtual_fs_open_blob();
    if (stream == NULL) {
        return false;
    }

    signed char fileid = install_stream(stream);
    if (fileid < 0) {
        fis_mem_fclose(stream);
        return false;
    }

    *fileid_out = fileid;
    return true;
}
