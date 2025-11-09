#include "rt_nonfinite.h"
#include "opkene.h"
#include "fileManager.h"
#include "opkene_emxutil.h"
#include "opkene_rtwutil.h"
#include "opkene_data.h"
#include <math.h>
#include <string.h>
#include "fis_virtual_fs.h"

static signed char filedata(void)
{
  signed char f;
  int k;
  boolean_T exitg1;
  f = 0;
  k = 0;
  exitg1 = false;
  while ((!exitg1) && (k < 20)) {
    if (eml_openfiles[k] == NULL) {
      f = (signed char)(k + 1);
      exitg1 = true;
    } else {
      k++;
    }
  }

  return f;
}

signed char cfopen(const emxArray_char_T *cfilename, const char *cpermission)
{
  signed char fileid;
  signed char j;
  fileid = -1;
  j = filedata();
  if (fis_virtual_fs_cfopen(cfilename, cpermission, &fileid)) {
    return fileid;
  }

  if (j >= 1) {
    if (cfilename->size[1] > 4095) {
      fileid = -1;
    } else {
      if ((fileid != 0) && (*cpermission == 'w')) {
        int k;
        for (k = fileid; k < 20; k++) {
          eml_openfiles[k] = eml_openfiles[k + 1];
          eml_autoflush[k] = eml_autoflush[k + 1];
        }
      }

      eml_openfiles[(int)(fileid - 1)] = fileManager((double)(fileid + 2));
      eml_autoflush[(int)(fileid - 1)] = false;
    }
  }

  return fileid;
}

FILE *fileManager(double varargin_1)
{
  signed char fileid;
  fileid = (signed char)rt_roundd_snf(varargin_1);
  if ((fileid >= 0) && (varargin_1 == fileid)) {
    if (fileid >= 3) {
      return eml_openfiles[fileid - 3];
    }
  }

  return NULL;
}

void filedata_init(void)
{
  eml_openfiles[0] = NULL;
  eml_autoflush[0] = false;
}
