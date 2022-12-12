
; POINTS TO REMEMBER 
; REMEMBER TO SET MEMORY LOC TO 2000H; table .
; ANSWER MUST CONTAIN WITHIN 4 digit numbers.
; SET 2000H with value of  number to be powered and SET 2004H add with value of power.
; RESET OTHER unnecessary MEMORY and FLAGS BEFORE EXECUTION.
; ANSWER WILL BE DISPLAYED ON 2010H and 2011H; 

MVI A,00H;
STA 2010h;
LDA 2004H;
MOV C,A;
LDA 2000H;
MOV B,A;
DCR B;
eis0:DCR C;
JZ last;
STA 20A0H;
LDA 2000H;
MOV E,A;
DCR E;
LDA 20A0H;
MOV D,A;
feriadd:ADD D;
JNC NOcarry;


JNZ pakh2kosameaayena;
STA 20A0H;
LDA 2010H;
INR A;
STA 2010H;
claighata:DCR C;
LDA 20A0h;
JZ last;
; b lai mileyako 
ferib:LDA 2000H;
MOV B,A;
DCR B;

LDA 2010h;
MOV D,A;
feri2add:ADD D;
STA 2010H;
DCR B;
JNZ feri2add;
JZ claighata;

pakh2kosameaayena:STA 20A0H; store a to 2010H;
MOV A,E;
CMP B;
JNZ aaileaddnagarne;

LDA 2000H; load a from 2000h to give to d
MOV L,A;
DCR L;
LDA 2010H; load a from 2010H;
MOV H,A;
ADDcarryuntil:ADD H;
DCR L;
JNZ ADDcarryuntil;
STA 2010H; store it to same location.

aaileaddnagarne: LDA 2010H;
INR A;
STA 2010H;
LDA 20A0H;

NOcarry:DCR E;
JZ eis0; jump if E is 0;
JNZ feriadd;

last:STA 2011H; store a last value 
hlt;
