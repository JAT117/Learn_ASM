main:
    BL lddr_val_reg
loop:
    cmp r2,r1            /* Have we reached 100 yet? */
    beq end              /* if r2 == r1, go to label end*/ 
    add r1,r1,#4         /* r1 < r2 then r1 ? r1 + 4 */
    b loop 

lddr_val_reg:
    mov r2,#100
    mov r1,#0
    BX LR                 /* Go to the beginning of the loop */

end:
    MOV r0, #01
    SWI 0x6B
    SWI 0x11
