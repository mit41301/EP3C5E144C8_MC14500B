The MC14500 has different names, the term ICU (Industrial Control Unit) is used, but often the MC14500 is simply called 1 bit processor.

The MC14500 allows to read an input bit using a IO-address. This bit can be processed using a 4 bit instruction and the internal one bit result register RR. The results can be written to an output bit at an IO-address.

Input and output data bits can be physical inputs and outputs where wires can be attached, but they can be connected to other devices as RAM or timers.

The addressing of the IO's is done completely externally of the MC14500. The 4 bits for the selected instruction of the MC14500 and the IO-address lines for the external IO multiplexer result in the data width of the program memory. The MC14500 used the term "memory word" for the data that comes out of the program memory. This document uses the term "command" as a synonym to "memory word". A command consists therefore of two things, the instruction and the IO-address.

Since the IO-address is externally of the MC14500, the command can be different between the different implementations. Additionally the location of the 4 instruction bits within the command depend also on the design. The instruction bits might occupy the high bits or the low bits within the command.

The MC14500 does not contain the program counter that addresses the command to be processed from the program memory. The number of program counter bits can therefore differ between the MC14500 designs.

The width of the program memory or the command is 4 bit of the instruction plus the number of IO-address lines. Small MC14500 designs will use 8 bit wide program memories being able to select up to 16 IO-addresses. Since this is not much, many MC14500 designs made use of 12 bit wide program memories being able to select up to 256 IO-addresses. 12 bit wide program memories made use of 4 bit wide ROM devices that existed in the past. Other MC14500 designs used 8 bit wide program memories, but two bytes per MC14500 command got read forming therefore a 16 bit wide command and being able to address up to 4096 IO-address lines used for physical IO's, single bit wide RAM and timer hardware. Reading two times from program memory creates an other variation in MC14500 design, the first byte read from the program could be in one design the low byte but in an other design the high byte of the command.

If the low significant byte comes first (the incrementing program counter reads the lower address in the program memory first) then it is a "little endian" (since the little end of the memory word comes first).

If the high significant byte comes first (the incrementing program counter reads the lower address in the program memory first) then it is a "big endian" (since the big end of the memory word comes first).

If the program memory is wide enough (as in FPGA designs and simulators) then the endian topic does not exist.
