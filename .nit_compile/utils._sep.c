/* This C file is generated by NIT to compile module utils. */
#include "utils._sep.h"
val_t utils___Float___absolue(val_t p0){
  struct {struct stack_frame_t me; val_t MORE_REG[2];} fra;
  val_t REGB0;
  val_t tmp;
  fra.me.prev = stack_frame_head; stack_frame_head = &fra.me;
  fra.me.file = LOCATE_utils;
  fra.me.line = 2;
  fra.me.meth = LOCATE_utils___Float___absolue;
  fra.me.has_broke = 0;
  fra.me.REG_size = 3;
  fra.me.REG[0] = NIT_NULL;
  fra.me.REG[1] = NIT_NULL;
  fra.me.REG[2] = NIT_NULL;
  fra.me.REG[0] = p0;
  /* ./utils.nit:4 */
  fra.me.REG[1] = fra.me.REG[0];
  /* ./utils.nit:5 */
  fra.me.REG[2] = BOX_Float(0.0);
  /* /Users/tony/Projects/nit/lib/standard//kernel.nit:187 */
  REGB0 = TAG_Bool(UNBOX_Float(fra.me.REG[0])<UNBOX_Float(fra.me.REG[2]));
  /* ./utils.nit:5 */
  if (UNTAG_Bool(REGB0)) {
    /* ./utils.nit:6 */
    fra.me.REG[2] = BOX_Float(2.0);
    /* /Users/tony/Projects/nit/lib/standard//kernel.nit:193 */
    fra.me.REG[2] = BOX_Float(UNBOX_Float(fra.me.REG[0])*UNBOX_Float(fra.me.REG[2]));
    /* /Users/tony/Projects/nit/lib/standard//kernel.nit:192 */
    fra.me.REG[2] = BOX_Float(UNBOX_Float(fra.me.REG[1])-UNBOX_Float(fra.me.REG[2]));
    /* ./utils.nit:6 */
    fra.me.REG[1] = fra.me.REG[2];
  }
  /* ./utils.nit:8 */
  goto label1;
  label1: while(0);
  stack_frame_head = fra.me.prev;
  return fra.me.REG[1];
}