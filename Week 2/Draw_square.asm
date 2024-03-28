// Draw Line at top
//want to load 65535 (1111 1111 1111 1111) but cannot as can only load 15 bits
@32767 // 0111 1111 1111 1111
D=A    // Load lower 15-bits
D=D+A  // Left shift by 1
D=D+1  // Add in lsb
@16384 // Base Screen address (top left)
M=D
@16385 // address of next 16 pixels in row
M=D
//Draw left Line
@31 //setup a counter to create line length 32
D=A
@0
M=D
@16416 // set up pointer to address of next line of screen 16384 + 32
D=A
@1
M=D
@1 // 0000 0000 0000 0001
D=A
@1
A=M
M=D
@32 //Increment pointer to next line  of screen
D=A
@1
M=M+D
@1 //Decrement counter
D=A
@0
M=M-D
D=M
@16
D;JGE // test if line complete
//Draw right Line
@31 //setup a counter to create line length 32
D=A
@0
M=D
@16417 // set up pointer to address of next line of screen 16385 + 32
D=A
@1
M=D
@16384 // set MSBto 1 0100 0000 0000 0000 (0x4000)
D=A   // Load lower 15-bits
D=D+A
@1
A=M
M=D
@32 //Increment pointer to next line  of screen
D=A
@1
M=M+D
@1 //Decrement counter
D=A
@0
M=M-D
D=M
@40
D;JGE // test if line complete
// Draw Line at Bottom
@32767 // 0111 1111 1111 1111
D=A    // Load lower 15-bits
D=D+A  // Left shift by 1
D=D+1  // Add in lsb
@17408 // Base Screen address (top left) + 32*32
M=D
@17409 // address of next 16 pixels in row
M=D
@66
0;JMP
