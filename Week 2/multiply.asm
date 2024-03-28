@R0  //x
D=M
@counter
M=D  //counter = x (RAM[0])
@1
D=A
@counter
M=M-D //counter = counter - 1
@R1  //y
D=M
@R3
M=D //sum=y
(LOOP)
@1
D=A
@counter
M=M-D //counter =counter -1
D=M //D = counter
@END
D;JLT  //Jump to end if D < 0
@R1
D=M //D=y
@R3
M=M+D // sum = sum + y
@LOOP
0;JMP //Jump to start of loop
(END)
@END
0;JMP
