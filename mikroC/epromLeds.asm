
_main:

;epromLeds.c,1 :: 		void main() {{
;epromLeds.c,2 :: 		ANSEL = 0;                 // Todos los pines de E/S se configuran como digitales
	CLRF       ANSEL+0
;epromLeds.c,3 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;epromLeds.c,4 :: 		PORTC = 0;                 // Valor inicial del puerto PORTB
	CLRF       PORTC+0
;epromLeds.c,5 :: 		TRISC = 0;                 // Todos los pines del puerto PORTB se configuran como salidas
	CLRF       TRISC+0
;epromLeds.c,6 :: 		PORTD = 0;                 // Valor inicial del puerto PORTB
	CLRF       PORTD+0
;epromLeds.c,7 :: 		TRISD = 0;                 // Todos los pines del puerto PORTD se configuran como salidas
	CLRF       TRISD+0
;epromLeds.c,8 :: 		TRISA = 0xFF;              // Todos los pines del puerto PORTA se configuran como entradas
	MOVLW      255
	MOVWF      TRISA+0
;epromLeds.c,9 :: 		PORTD = EEPROM_Read(5);    // Leer la memoria EEPROM en la dirección 5
	MOVLW      5
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;epromLeds.c,11 :: 		do {
L_main0:
;epromLeds.c,12 :: 		PORTC = PORTC++;         // Incrementar el puerto PORTB en 1
	INCF       PORTC+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      PORTC+0
;epromLeds.c,13 :: 		Delay_ms(100);           // Tiempo de retardo de 100mS
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;epromLeds.c,15 :: 		if (PORTA.F2)
	BTFSS      PORTA+0, 2
	GOTO       L_main4
;epromLeds.c,16 :: 		EEPROM_Write(5,PORTC); // Si se pulsa el botón MEMO, guardar el puerto PORTB
	MOVLW      5
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       PORTC+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
L_main4:
;epromLeds.c,18 :: 		PORTD = EEPROM_Read(5);  // Leer el dato escrito
	MOVLW      5
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;epromLeds.c,24 :: 		while(1);                  // Bucle infinito
	GOTO       L_main0
;epromLeds.c,25 :: 		}}
L_end_main:
	GOTO       $+0
; end of _main
