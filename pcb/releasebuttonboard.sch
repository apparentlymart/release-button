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
P 2200 2600
F 0 "U?" H 1800 3950 60  0000 C CNN
F 1 "RASPIPLUSHEADER" H 2250 1150 60  0000 C CNN
F 2 "" H 2200 2350 60  0000 C CNN
F 3 "" H 2200 2350 60  0000 C CNN
	1    2200 2600
	1    0    0    -1  
$EndComp
$Comp
L OLEDHeader U?
U 1 1 54A7A9C0
P 8200 4350
F 0 "U?" H 8200 4850 60  0000 C CNN
F 1 "OLEDHeader" H 8400 3750 60  0000 C CNN
F 2 "" H 8200 4550 60  0000 C CNN
F 3 "" H 8200 4550 60  0000 C CNN
	1    8200 4350
	1    0    0    -1  
$EndComp
$Comp
L BtnHeader U?
U 1 1 54A7AA14
P 8250 5650
F 0 "U?" H 8250 5950 60  0000 C CNN
F 1 "BtnHeader" H 8450 5350 60  0000 C CNN
F 2 "" H 8250 5700 60  0000 C CNN
F 3 "" H 8250 5700 60  0000 C CNN
	1    8250 5650
	1    0    0    -1  
$EndComp
$Comp
L REncHeader U?
U 1 1 54A7ABB1
P 8100 1550
F 0 "U?" H 8100 1900 60  0000 C CNN
F 1 "REncHeader" H 8300 1250 60  0000 C CNN
F 2 "" H 8100 1600 60  0000 C CNN
F 3 "" H 8100 1600 60  0000 C CNN
	1    8100 1550
	1    0    0    -1  
$EndComp
$Comp
L 24C16 U?
U 1 1 54A83FFB
P 1800 6650
F 0 "U?" H 1950 7000 60  0000 C CNN
F 1 "24C16" H 2000 6300 60  0000 C CNN
F 2 "" H 1800 6650 60  0000 C CNN
F 3 "" H 1800 6650 60  0000 C CNN
	1    1800 6650
	1    0    0    -1  
$EndComp
Text GLabel 1500 4000 3    60   Output ~ 0
GND
Wire Wire Line
	1550 3200 1500 3200
Wire Wire Line
	1500 3200 1500 4000
Wire Wire Line
	1550 3300 1500 3300
Connection ~ 1500 3300
Wire Wire Line
	1550 3400 1500 3400
Connection ~ 1500 3400
Wire Wire Line
	1550 3500 1500 3500
Connection ~ 1500 3500
Wire Wire Line
	1550 3600 1500 3600
Connection ~ 1500 3600
Wire Wire Line
	1550 3700 1500 3700
Connection ~ 1500 3700
Wire Wire Line
	1550 3800 1500 3800
Connection ~ 1500 3800
Wire Wire Line
	1550 3900 1500 3900
Connection ~ 1500 3900
Text GLabel 1500 1300 1    60   Output ~ 0
VCC
Wire Wire Line
	1500 1300 1500 1500
Wire Wire Line
	1500 1500 1550 1500
Wire Wire Line
	1550 1400 1500 1400
Connection ~ 1500 1400
Text Label 1500 2400 2    60   ~ 0
ID_SC
Text Label 1500 2500 2    60   ~ 0
ID_SD
Wire Wire Line
	1500 2400 1550 2400
Wire Wire Line
	1500 2500 1550 2500
Text GLabel 1800 5750 1    60   Input ~ 0
VCC
Text GLabel 1800 7250 3    60   Input ~ 0
GND
Wire Wire Line
	1800 5750 1800 6150
Wire Wire Line
	1800 7150 1800 7250
Wire Wire Line
	1050 7200 1800 7200
Wire Wire Line
	1050 5900 1050 7200
Wire Wire Line
	1050 6450 1100 6450
Connection ~ 1800 7200
Wire Wire Line
	1100 6550 1050 6550
Connection ~ 1050 6550
Wire Wire Line
	1100 6650 1050 6650
Connection ~ 1050 6650
$Comp
L JUMPER JP?
U 1 1 54A841ED
P 3000 6450
F 0 "JP?" H 3000 6600 60  0000 C CNN
F 1 "JUMPER" H 3000 6370 40  0000 C CNN
F 2 "" H 3000 6450 60  0000 C CNN
F 3 "" H 3000 6450 60  0000 C CNN
	1    3000 6450
	-1   0    0    1   
$EndComp
Text Label 3200 6750 0    60   ~ 0
ID_SC
Text Label 3200 6850 0    60   ~ 0
ID_SD
Wire Wire Line
	2500 6750 3200 6750
Wire Wire Line
	2500 6850 3200 6850
Text Notes 2950 5600 0    60   ~ 0
HAT ID EEPROM
Text Label 2900 2400 0    60   ~ 0
AUD_L
Text Label 2900 2500 0    60   ~ 0
AUD_R
Wire Wire Line
	2850 2400 2900 2400
Wire Wire Line
	2850 2500 2900 2500
$Comp
L C C?
U 1 1 54A8751D
P 1400 5900
F 0 "C?" H 1400 6000 40  0000 L CNN
F 1 "100nF" H 1406 5815 40  0000 L CNN
F 2 "" H 1438 5750 30  0000 C CNN
F 3 "" H 1400 5900 60  0000 C CNN
	1    1400 5900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1200 5900 1050 5900
Connection ~ 1050 6450
Wire Wire Line
	1600 5900 2600 5900
Connection ~ 1800 5900
$Comp
L R R?
U 1 1 54A87661
P 2600 6200
F 0 "R?" V 2680 6200 40  0000 C CNN
F 1 "1K" V 2607 6201 40  0000 C CNN
F 2 "" V 2530 6200 30  0000 C CNN
F 3 "" H 2600 6200 30  0000 C CNN
	1    2600 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 6550 2600 6450
Wire Wire Line
	2600 5900 2600 5950
Text GLabel 3400 6450 2    60   Input ~ 0
GND
$Comp
L R R?
U 1 1 54A878B0
P 2750 7250
F 0 "R?" V 2830 7250 40  0000 C CNN
F 1 "3.9K" V 2757 7251 40  0000 C CNN
F 2 "" V 2680 7250 30  0000 C CNN
F 3 "" H 2750 7250 30  0000 C CNN
	1    2750 7250
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 54A878C4
P 2950 7250
F 0 "R?" V 3030 7250 40  0000 C CNN
F 1 "3.9K" V 2957 7251 40  0000 C CNN
F 2 "" V 2880 7250 30  0000 C CNN
F 3 "" H 2950 7250 30  0000 C CNN
	1    2950 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 6550 2700 6550
Wire Wire Line
	2700 6550 2700 6450
Connection ~ 2600 6550
Wire Wire Line
	3300 6450 3400 6450
Wire Wire Line
	2950 6750 2950 7000
Connection ~ 2950 6750
Wire Wire Line
	2750 6850 2750 7000
Connection ~ 2750 6850
Text GLabel 3100 7500 2    60   Input ~ 0
VCC
Wire Wire Line
	2750 7500 3100 7500
Connection ~ 2950 7500
Wire Notes Line
	900  5450 3700 5450
Wire Notes Line
	3700 5450 3700 7600
Wire Notes Line
	3700 7600 900  7600
Wire Notes Line
	900  7600 900  5450
$EndSCHEMATC
