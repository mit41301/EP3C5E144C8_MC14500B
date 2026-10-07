To exchange mif file witout the need to restart the whole compilation process.
Exchange the new mif file (out.mif) with the old one and keep the filename.
Then type at dos prompt in the working project directory:

memory_update mc14500cpu.qpf


Sample programs and their test stimuli to validate the design and what they test

Program		Stimuli	 NOPO LD LDC AND ANDC OR ORC XNOR STO STOC IEN OEN JMP RTN SKZ NOPF I WO RO RAM 
and.asm         gate          LD     AND         ORC      STO      IEN OEN JMP              I WO
counter.asm     counter       LD     AND         ORC XNOR     STOC IEN OEN JMP                WO    RAM
dice.asm        dice     NOPO LD                 ORC      STO STOC IEN OEN JMP     SKZ NOPF I WO
iotest.asm      gate4         LD     AND         ORC      STO      IEN OEN JMP              I WO RO
latch.asm       latch         LD                 ORC      STO      IEN OEN JMP              I WO
nand.asm        gate          LD     AND         ORC          STOC IEN OEN JMP              I WO
nor.asm         gate          LD              OR ORC          STOC IEN OEN JMP              I WO
not.asm         gate             LDC             ORC      STO      IEN OEN JMP              I WO
or.asm          gate             LDC     ANDC    ORC          STOC IEN OEN JMP              I WO
ramtest.asm     gate4         LD     AND         ORC      STO      IEN OEN JMP              I WO    RAM
rtn.asm         gate     NOPO                    ORC               IEN OEN JMP RTN 
runniglight.asm gate                             ORC      STO STOC IEN OEN JMP                WO
square.asm      gate     NOPO                    ORC      STO STOC IEN OEN JMP                WO
xor.asm         gate          LD                 ORC XNOR     STOC IEN OEN JMP              I WO