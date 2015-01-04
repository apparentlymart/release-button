EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:releasebutton
LIBS:releasebuttonboard-cache
EELAYER 24 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "Release Button PCB"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L RASPIPLUSHEADER U?
U 1 1 54A79B4A
P 1700 2350
F 0 "U?" H 1300 3700 60  0000 C CNN
F 1 "RASPIPLUSHEADER" H 1750 900 60  0000 C CNN
F 2 "" H 1700 2100 60  0000 C CNN
F 3 "" H 1700 2100 60  0000 C CNN
	1    1700 2350
	1    0    0    -1  
$EndComp
$Comp
L OLEDHeader U?
U 1 1 54A7A9C0
P 4400 7100
F 0 "U?" H 4400 7600 60  0000 C CNN
F 1 "OLEDHeader" H 4600 6500 60  0000 C CNN
F 2 "" H 4400 7300 60  0000 C CNN
F 3 "" H 4400 7300 60  0000 C CNN
	1    4400 7100
	1    0    0    -1  
$EndComp
$Comp
L BtnHeader U?
U 1 1 54A7AA14
P 3150 3850
F 0 "U?" H 3150 4150 60  0000 C CNN
F 1 "BtnHeader" H 3350 3550 60  0000 C CNN
F 2 "" H 3150 3900 60  0000 C CNN
F 3 "" H 3150 3900 60  0000 C CNN
	1    3150 3850
	1    0    0    -1  
$EndComp
$Comp
L REncHeader U?
U 1 1 54A7ABB1
P 4600 5750
F 0 "U?" H 4600 6100 60  0000 C CNN
F 1 "REncHeader" H 4800 5450 60  0000 C CNN
F 2 "" H 4600 5800 60  0000 C CNN
F 3 "" H 4600 5800 60  0000 C CNN
	1    4600 5750
	1    0    0    -1  
$EndComp
$Comp
L 24C16 U?
U 1 1 54A83FFB
P 1600 6850
F 0 "U?" H 1750 7200 60  0000 C CNN
F 1 "24C16" H 1800 6500 60  0000 C CNN
F 2 "" H 1600 6850 60  0000 C CNN
F 3 "" H 1600 6850 60  0000 C CNN
	1    1600 6850
	1    0    0    -1  
$EndComp
Text GLabel 1000 3750 3    60   Output ~ 0
GND
Text GLabel 1000 1050 1    60   Output ~ 0
VCC
Text Label 1000 2150 2    60   ~ 0
ID_SC
Text Label 1000 2250 2    60   ~ 0
ID_SD
Text GLabel 1600 5950 1    60   Input ~ 0
VCC
Text GLabel 1600 7450 3    60   Input ~ 0
GND
$Comp
L JUMPER JP?
U 1 1 54A841ED
P 2800 6650
F 0 "JP?" H 2800 6800 60  0000 C CNN
F 1 "JUMPER" H 2800 6570 40  0000 C CNN
F 2 "" H 2800 6650 60  0000 C CNN
F 3 "" H 2800 6650 60  0000 C CNN
	1    2800 6650
	-1   0    0    1   
$EndComp
Text Label 3000 6950 0    60   ~ 0
ID_SC
Text Label 3000 7050 0    60   ~ 0
ID_SD
Text Notes 2750 5800 0    60   ~ 0
HAT ID EEPROM
Text Label 2400 2150 0    60   ~ 0
AUD_L
Text Label 2400 2250 0    60   ~ 0
AUD_R
$Comp
L C C?
U 1 1 54A8751D
P 1200 6100
F 0 "C?" H 1200 6200 40  0000 L CNN
F 1 "100nF" H 1206 6015 40  0000 L CNN
F 2 "" H 1238 5950 30  0000 C CNN
F 3 "" H 1200 6100 60  0000 C CNN
	1    1200 6100
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 54A87661
P 2400 6400
F 0 "R?" V 2480 6400 40  0000 C CNN
F 1 "1K" V 2407 6401 40  0000 C CNN
F 2 "" V 2330 6400 30  0000 C CNN
F 3 "" H 2400 6400 30  0000 C CNN
	1    2400 6400
	1    0    0    -1  
$EndComp
Text GLabel 3200 6650 2    60   Input ~ 0
GND
$Comp
L R R?
U 1 1 54A878B0
P 2550 7450
F 0 "R?" V 2630 7450 40  0000 C CNN
F 1 "3.9K" V 2557 7451 40  0000 C CNN
F 2 "" V 2480 7450 30  0000 C CNN
F 3 "" H 2550 7450 30  0000 C CNN
	1    2550 7450
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 54A878C4
P 2750 7450
F 0 "R?" V 2830 7450 40  0000 C CNN
F 1 "3.9K" V 2757 7451 40  0000 C CNN
F 2 "" V 2680 7450 30  0000 C CNN
F 3 "" H 2750 7450 30  0000 C CNN
	1    2750 7450
	1    0    0    -1  
$EndComp
Text GLabel 2900 7700 2    60   Input ~ 0
VCC
$Comp
L FILTER FB?
U 1 1 54A87BC1
P 8150 1250
F 0 "FB?" H 8150 1400 60  0000 C CNN
F 1 "FILTER" H 8150 1150 60  0000 C CNN
F 2 "" H 8150 1250 60  0000 C CNN
F 3 "" H 8150 1250 60  0000 C CNN
	1    8150 1250
	1    0    0    -1  
$EndComp
$Comp
L FILTER FB?
U 1 1 54A87BD5
P 8150 1650
F 0 "FB?" H 8150 1800 60  0000 C CNN
F 1 "FILTER" H 8150 1550 60  0000 C CNN
F 2 "" H 8150 1650 60  0000 C CNN
F 3 "" H 8150 1650 60  0000 C CNN
	1    8150 1650
	1    0    0    -1  
$EndComp
$Comp
L PAM8407 U?
U 1 1 54A880F4
P 6450 2050
F 0 "U?" H 6200 2650 60  0000 C CNN
F 1 "PAM8407" H 6550 1450 60  0000 C CNN
F 2 "" H 6400 2150 60  0000 C CNN
F 3 "" H 6400 2150 60  0000 C CNN
	1    6450 2050
	1    0    0    -1  
$EndComp
Text GLabel 1000 1600 3    60   Output ~ 0
AVCC
Text GLabel 9950 850  2    60   Input ~ 0
VCC
Text GLabel 9950 2050 2    60   Input ~ 0
GND
$Comp
L SPEAKER SP?
U 1 1 54A88374
P 9000 1450
F 0 "SP?" H 8900 1700 70  0000 C CNN
F 1 "SPEAKER" H 8900 1200 70  0000 C CNN
F 2 "" H 9000 1450 60  0000 C CNN
F 3 "" H 9000 1450 60  0000 C CNN
	1    9000 1450
	1    0    0    -1  
$EndComp
$Comp
L FILTER FB?
U 1 1 54A884E7
P 8150 2450
F 0 "FB?" H 8150 2600 60  0000 C CNN
F 1 "FILTER" H 8150 2350 60  0000 C CNN
F 2 "" H 8150 2450 60  0000 C CNN
F 3 "" H 8150 2450 60  0000 C CNN
	1    8150 2450
	1    0    0    -1  
$EndComp
$Comp
L FILTER FB?
U 1 1 54A884ED
P 8150 2850
F 0 "FB?" H 8150 3000 60  0000 C CNN
F 1 "FILTER" H 8150 2750 60  0000 C CNN
F 2 "" H 8150 2850 60  0000 C CNN
F 3 "" H 8150 2850 60  0000 C CNN
	1    8150 2850
	1    0    0    -1  
$EndComp
$Comp
L SPEAKER SP?
U 1 1 54A884F3
P 9000 2650
F 0 "SP?" H 8900 2900 70  0000 C CNN
F 1 "SPEAKER" H 8900 2400 70  0000 C CNN
F 2 "" H 9000 2650 60  0000 C CNN
F 3 "" H 9000 2650 60  0000 C CNN
	1    9000 2650
	1    0    0    -1  
$EndComp
Text GLabel 9950 3250 2    60   Input ~ 0
VCC
$Comp
L C C?
U 1 1 54A8854B
P 9800 1400
F 0 "C?" H 9800 1500 40  0000 L CNN
F 1 "1uF" H 9806 1315 40  0000 L CNN
F 2 "" H 9838 1250 30  0000 C CNN
F 3 "" H 9800 1400 60  0000 C CNN
	1    9800 1400
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 54A8856C
P 9800 2600
F 0 "C?" H 9800 2700 40  0000 L CNN
F 1 "1uF" H 9806 2515 40  0000 L CNN
F 2 "" H 9838 2450 30  0000 C CNN
F 3 "" H 9800 2600 60  0000 C CNN
	1    9800 2600
	1    0    0    -1  
$EndComp
Text GLabel 5150 2050 0    60   Input ~ 0
VCC
$Comp
L R R?
U 1 1 54A88EE7
P 5500 1850
F 0 "R?" V 5580 1850 40  0000 C CNN
F 1 "10K" V 5507 1851 40  0000 C CNN
F 2 "" V 5430 1850 30  0000 C CNN
F 3 "" H 5500 1850 30  0000 C CNN
	1    5500 1850
	0    -1   -1   0   
$EndComp
Text GLabel 5150 2250 0    60   Input ~ 0
GND
Text GLabel 5150 1600 0    60   Input ~ 0
GND
Text GLabel 5150 2500 0    60   Input ~ 0
GND
$Comp
L C C?
U 1 1 54A89346
P 5400 1600
F 0 "C?" H 5400 1700 40  0000 L CNN
F 1 "0.1uF" H 5406 1515 40  0000 L CNN
F 2 "" H 5438 1450 30  0000 C CNN
F 3 "" H 5400 1600 60  0000 C CNN
	1    5400 1600
	0    -1   -1   0   
$EndComp
$Comp
L C C?
U 1 1 54A89373
P 5400 1400
F 0 "C?" H 5400 1500 40  0000 L CNN
F 1 "0.1uF" H 5406 1315 40  0000 L CNN
F 2 "" H 5438 1250 30  0000 C CNN
F 3 "" H 5400 1400 60  0000 C CNN
	1    5400 1400
	0    -1   -1   0   
$EndComp
$Comp
L C C?
U 1 1 54A894DA
P 5400 2500
F 0 "C?" H 5400 2600 40  0000 L CNN
F 1 "0.1uF" H 5406 2415 40  0000 L CNN
F 2 "" H 5438 2350 30  0000 C CNN
F 3 "" H 5400 2500 60  0000 C CNN
	1    5400 2500
	0    -1   -1   0   
$EndComp
$Comp
L C C?
U 1 1 54A894E5
P 5400 2700
F 0 "C?" H 5400 2800 40  0000 L CNN
F 1 "0.1uF" H 5406 2615 40  0000 L CNN
F 2 "" H 5438 2550 30  0000 C CNN
F 3 "" H 5400 2700 60  0000 C CNN
	1    5400 2700
	0    -1   -1   0   
$EndComp
Text Label 5150 1400 2    60   ~ 0
AUD_R
Text Label 5150 2700 2    60   ~ 0
AUD_L
Text Notes 4850 3350 0    60   ~ 0
AUDIO OUTPUT
Text GLabel 4200 7600 0    60   Input ~ 0
GND
Text GLabel 4200 6700 0    60   Input ~ 0
VCC
Text Label 4200 7000 2    60   ~ 0
OLEDCLK
Text Label 4200 7100 2    60   ~ 0
OLEDDATA
Text Label 4200 7200 2    60   ~ 0
OLEDDC
Text Label 4200 7300 2    60   ~ 0
OLEDCS
Text Label 4200 7450 2    60   ~ 0
OLEDRST
Text Label 2400 1750 0    60   ~ 0
OLEDCS
Text Label 2400 2350 0    60   ~ 0
OLEDRST
Text Label 2400 2450 0    60   ~ 0
OLEDDC
Text Label 2400 2050 0    60   ~ 0
OLEDCLK
Text Label 2400 1950 0    60   ~ 0
OLEDDATA
Text Label 4200 5850 2    60   ~ 0
MNUPUSH
Text GLabel 4500 5950 0    60   Input ~ 0
VCC
Text GLabel 4500 5600 0    60   Input ~ 0
VCC
Text Label 4200 5500 2    60   ~ 0
MNUROTA
Text Label 4200 5700 2    60   ~ 0
MNUROTB
Text Notes 3900 6250 0    39   ~ 0
Note: Assumes Pull-down Resistors\non GPIO pins.
Wire Wire Line
	1050 2950 1000 2950
Wire Wire Line
	1000 2950 1000 3750
Wire Wire Line
	1050 3050 1000 3050
Connection ~ 1000 3050
Wire Wire Line
	1050 3150 1000 3150
Connection ~ 1000 3150
Wire Wire Line
	1050 3250 1000 3250
Connection ~ 1000 3250
Wire Wire Line
	1050 3350 1000 3350
Connection ~ 1000 3350
Wire Wire Line
	1050 3450 1000 3450
Connection ~ 1000 3450
Wire Wire Line
	1050 3550 1000 3550
Connection ~ 1000 3550
Wire Wire Line
	1050 3650 1000 3650
Connection ~ 1000 3650
Wire Wire Line
	1000 1050 1000 1250
Wire Wire Line
	1000 1250 1050 1250
Wire Wire Line
	1050 1150 1000 1150
Connection ~ 1000 1150
Wire Wire Line
	1000 2150 1050 2150
Wire Wire Line
	1000 2250 1050 2250
Wire Wire Line
	1600 5950 1600 6350
Wire Wire Line
	1600 7350 1600 7450
Wire Wire Line
	850  7400 1600 7400
Wire Wire Line
	850  6100 850  7400
Wire Wire Line
	850  6650 900  6650
Connection ~ 1600 7400
Wire Wire Line
	900  6750 850  6750
Connection ~ 850  6750
Wire Wire Line
	900  6850 850  6850
Connection ~ 850  6850
Wire Wire Line
	2300 6950 3000 6950
Wire Wire Line
	2300 7050 3000 7050
Wire Wire Line
	2350 2150 2400 2150
Wire Wire Line
	2350 2250 2400 2250
Wire Wire Line
	1000 6100 850  6100
Connection ~ 850  6650
Wire Wire Line
	1400 6100 2400 6100
Connection ~ 1600 6100
Wire Wire Line
	2400 6750 2400 6650
Wire Wire Line
	2400 6100 2400 6150
Wire Wire Line
	2300 6750 2500 6750
Wire Wire Line
	2500 6750 2500 6650
Connection ~ 2400 6750
Wire Wire Line
	3100 6650 3200 6650
Wire Wire Line
	2750 6950 2750 7200
Connection ~ 2750 6950
Wire Wire Line
	2550 7050 2550 7200
Connection ~ 2550 7050
Wire Wire Line
	2550 7700 2900 7700
Connection ~ 2750 7700
Wire Notes Line
	700  5650 3500 5650
Wire Notes Line
	3500 5650 3500 7800
Wire Notes Line
	3500 7800 700  7800
Wire Notes Line
	700  7800 700  5650
Wire Wire Line
	1050 1500 1000 1500
Wire Wire Line
	1000 1400 1000 1600
Wire Wire Line
	1050 1400 1000 1400
Connection ~ 1000 1500
Wire Wire Line
	8500 1250 8600 1250
Wire Wire Line
	8600 1250 8600 1350
Wire Wire Line
	8600 1350 8700 1350
Wire Wire Line
	8550 1650 8600 1650
Wire Wire Line
	8600 1650 8600 1550
Wire Wire Line
	8600 1550 8700 1550
Wire Wire Line
	8500 2450 8600 2450
Wire Wire Line
	8600 2450 8600 2550
Wire Wire Line
	8600 2550 8700 2550
Wire Wire Line
	8550 2850 8600 2850
Wire Wire Line
	8600 2850 8600 2750
Wire Wire Line
	8600 2750 8700 2750
Wire Wire Line
	7200 850  9950 850 
Wire Wire Line
	9800 850  9800 1200
Wire Wire Line
	9800 1600 9800 2400
Wire Wire Line
	7200 2050 9950 2050
Connection ~ 9800 2050
Wire Wire Line
	9800 2800 9800 3250
Wire Wire Line
	7250 3250 9950 3250
Wire Wire Line
	7050 2000 7200 2000
Wire Wire Line
	7200 2000 7200 2100
Wire Wire Line
	7200 2100 7050 2100
Connection ~ 7200 2050
Wire Wire Line
	7050 1850 7700 1850
Wire Wire Line
	7700 1850 7700 1650
Wire Wire Line
	7700 1650 7800 1650
Wire Wire Line
	7050 1750 7600 1750
Wire Wire Line
	7600 1750 7600 1250
Wire Wire Line
	7600 1250 7800 1250
Wire Wire Line
	7050 2250 7700 2250
Wire Wire Line
	7700 2250 7700 2450
Wire Wire Line
	7700 2450 7800 2450
Wire Wire Line
	7050 2350 7600 2350
Wire Wire Line
	7600 2350 7600 2850
Wire Wire Line
	7600 2850 7800 2850
Wire Wire Line
	7050 1600 7200 1600
Wire Wire Line
	7200 1600 7200 850 
Connection ~ 9800 850 
Wire Wire Line
	7050 2500 7250 2500
Wire Wire Line
	7250 2500 7250 3250
Connection ~ 9800 3250
Wire Wire Line
	5850 2000 5700 2000
Wire Wire Line
	5700 2000 5700 2100
Wire Wire Line
	5150 2050 5700 2050
Wire Wire Line
	5700 2100 5850 2100
Connection ~ 5700 2050
Wire Wire Line
	5250 1850 5250 2050
Connection ~ 5250 2050
Wire Wire Line
	5750 1850 5850 1850
Wire Wire Line
	5850 2250 5150 2250
Wire Wire Line
	5850 1700 5650 1700
Wire Wire Line
	5650 1700 5650 1600
Wire Wire Line
	5650 1600 5600 1600
Wire Wire Line
	5200 1600 5150 1600
Wire Wire Line
	5850 1600 5700 1600
Wire Wire Line
	5700 1600 5700 1400
Wire Wire Line
	5700 1400 5600 1400
Wire Wire Line
	5150 2500 5200 2500
Wire Wire Line
	5600 2500 5650 2500
Wire Wire Line
	5650 2500 5650 2400
Wire Wire Line
	5650 2400 5850 2400
Wire Wire Line
	5850 2500 5700 2500
Wire Wire Line
	5700 2500 5700 2700
Wire Wire Line
	5700 2700 5600 2700
Wire Wire Line
	5150 1400 5200 1400
Wire Wire Line
	5150 2700 5200 2700
Wire Notes Line
	10300 700  4800 700 
Wire Notes Line
	4800 700  4800 3400
Wire Notes Line
	4800 3400 10300 3400
Wire Notes Line
	10300 3400 10300 700 
Wire Wire Line
	4200 6700 4400 6700
Wire Wire Line
	4200 7000 4400 7000
Wire Wire Line
	4200 7100 4400 7100
Wire Wire Line
	4200 7200 4400 7200
Wire Wire Line
	4200 7300 4400 7300
Wire Wire Line
	4200 7450 4400 7450
Wire Wire Line
	4200 7600 4400 7600
Wire Notes Line
	3700 6500 3700 7800
Wire Notes Line
	3700 7800 5000 7800
Wire Notes Line
	5000 7800 5000 6500
Wire Notes Line
	5000 6500 3700 6500
Wire Wire Line
	2350 1750 2400 1750
Wire Wire Line
	2350 1950 2400 1950
Wire Wire Line
	2350 2050 2400 2050
Wire Wire Line
	2350 2350 2400 2350
Wire Wire Line
	2350 2450 2400 2450
Wire Wire Line
	4500 5950 4600 5950
Wire Wire Line
	4500 5600 4600 5600
Wire Wire Line
	4200 5850 4600 5850
Wire Wire Line
	4200 5700 4600 5700
Wire Wire Line
	4200 5500 4600 5500
Wire Notes Line
	3700 5200 3700 6300
Wire Notes Line
	3700 6300 5200 6300
Wire Notes Line
	5200 6300 5200 5200
Wire Notes Line
	5200 5200 3700 5200
Text Notes 4000 5300 0    60   ~ 0
ROTARY ENCODER HEADER
Text Label 2400 3650 0    60   ~ 0
MNUPUSH
Text Label 2400 3450 0    60   ~ 0
MNUROTA
Wire Wire Line
	2350 3650 2400 3650
Wire Wire Line
	2350 3450 2400 3450
Text Label 2400 3550 0    60   ~ 0
MNUROTB
Wire Wire Line
	2350 3550 2400 3550
$EndSCHEMATC
