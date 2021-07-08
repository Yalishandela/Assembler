.model small
.data
.code

LED_MASK	EQU	 10000000B

			EQU    0H
			EQU    2
			LJMP   START
			ORG    0BH
			LJMP   TIMER0
			ORG    100H

START:
			MOV   TMOD, 100
			MOV   TH0, 100
			MOV   TL0, 100
			SETB  EA
			SETB  ET0
			LJMP  $

TIMER0:			CLR   TRO
			MOV   TH0, 100
			MOV   TL0, 100
			MOV   AH, CALC
			LJMP  DECREMENT
			XRL   P1, #LED_MASK
			MOV   CALC, #PERIODIC
			RETI

TIMER1:
			CLR   TR1
			MOV   TH0, 300
			MOV   TL0, 300
			MOV   A, CALC
			LJMP  DECREMENT
			XRL   P1, #LED_MASK
			MOV   CALC, #PERIODIC
			RETI

DECREMENT:
			DEC   CLAC
			RETI
