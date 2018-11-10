.ORG 1000h;






	inicio:
	
	MVI A,00h
	MVI B,00h
	MVI C,00h
	MVI D,00h
	MVI E,00h;	PONEMOS TODOS LOS REGISTROS A 00
	MVI H,00h
	MVI L,00h
	
	MVI C,4h; ponemos en el registro c el valor 4.
	MVI A,7h; ponemos en el registro a el valor a multiplicar (7 en hexadecimal).
	MOV B,A; movemos el valor del acumulador al registro B.

	jmp producto
	jmp intermedio
	;jmp cociente

	
	producto:

	ADI 7; sumamos 7 con adi al valor ya almacenado en el acumulador(inicialmente 00).
	STA 1101H; Movemos el 7 a la posici�n de memoria 1101h. 
	DCR C; decrementamos el registro c en una unidad por vuelta.
	JNZ producto; mientras el registro c no sea 0,se salta a la subrutina producto.
	 


	intermedio:

	MVI A,00h
	MVI B,00h
	MVI C,00h
	MVI D,00h
	MVI E,00h;	PONEMOS TODOS LOS REGISTROS A cero.
	MVI H,00h
	MVI L,00h
	
	MVI A,3h; ponemos en el registro A el valor a dividir (3 en hexadecimal).
	STA 1100h; movemos el valor del acumulador a la posici�n de memoria 1100H
	MOV B,A; movemos el valor del acumulador al registro B(este registro actua como dividendo).
	MVI A,28h; ponemos en el acumulador el valor 
	STA 1101h; ponemos el valor del acumulador en la posici�n de memoria 1101h.

	JMP cociente


	cociente:
	
	SUB B; restamos el valor del registro B al acumulador.
	
	
	MOV C,A; movemos el valor del acumulador al registro C
	STA 1102h; ponemos el valor del acumulador en la posici�n de memoria 1102h.
	
	INR D;
	DCR C;
	JNZ cociente

	MOV A,D;
	STA 1103h;

	JMP FIN

	FIN:
	HLT
		