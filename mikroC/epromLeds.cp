#line 1 "C:/Users/rherr/Downloads/Ken/septimoSemestre/arquitecturaDeComputadoras/Tareas/memoriaEpromLeds/mikroC/epromLeds.c"
void main() {{
 ANSEL = 0;
 ANSELH = 0;
 PORTC = 0;
 TRISC = 0;
 PORTD = 0;
 TRISD = 0;
 TRISA = 0xFF;
 PORTD = EEPROM_Read(5);

 do {
 PORTC = PORTC++;
 Delay_ms(100);

 if (PORTA.F2)
 EEPROM_Write(5,PORTC);

 PORTD = EEPROM_Read(5);
#line 23 "C:/Users/rherr/Downloads/Ken/septimoSemestre/arquitecturaDeComputadoras/Tareas/memoriaEpromLeds/mikroC/epromLeds.c"
 }
 while(1);
}}
