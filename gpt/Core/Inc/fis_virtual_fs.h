#ifndef FIS_VIRTUAL_FS_H_
#define FIS_VIRTUAL_FS_H_

#include <stddef.h>
#include <stdint.h>

#include "rtwtypes.h"
#include "opkene_types.h"

#ifdef __cplusplus
extern "C" {
#endif

void fis_virtual_fs_init(void);
void fis_virtual_fs_reset(void);
FILE *fis_virtual_fs_open_blob(void);
void fis_virtual_fs_close_blob(FILE *stream);
boolean_T fis_virtual_fs_cfopen(const emxArray_char_T *cfilename,
                                const char *cpermission,
                                signed char *fileid_out);

#ifdef __cplusplus
}
#endif

#endif /* FIS_VIRTUAL_FS_H_ */
