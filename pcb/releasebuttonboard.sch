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
P 1900 6500
F 0 "U?" H 2050 6850 60  0000 C CNN
F 1 "24C16" H 2100 6150 60  0000 C CNN
F 2 "" H 1900 6500 60  0000 C CNN
F 3 "" H 1900 6500 60  0000 C CNN
	1    1900 6500
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
Text GLabel 1900 5600 1    60   Input ~ 0
VCC
Text GLabel 1900 7100 3    60   Input ~ 0
GND
Wire Wire Line
	1900 5600 1900 6000
Wire Wire Line
	1900 7000 1900 7100
Wire Wire Line
	1900 7050 1150 7050
Wire Wire Line
	1150 7050 1150 6300
Wire Wire Line
	1150 6300 1200 6300
Connection ~ 1900 7050
Wire Wire Line
	1200 6400 1150 6400
Connection ~ 1150 6400
Wire Wire Line
	1200 6500 1150 6500
Connection ~ 1150 6500
$Comp
L JUMPER JP?
U 1 1 54A841ED
P 2800 6100
F 0 "JP?" H 2800 6250 60  0000 C CNN
F 1 "JUMPER" H 2800 6020 40  0000 C CNN
F 2 "" H 2800 6100 60  0000 C CNN
F 3 "" H 2800 6100 60  0000 C CNN
	1    2800 6100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2800 5800 2800 5750
Wire Wire Line
	2800 5750 1900 5750
Connection ~ 1900 5750
Wire Wire Line
	2600 6400 2800 6400
Text Label 2650 6600 0    60   ~ 0
ID_SC
Text Label 2650 6700 0    60   ~ 0
ID_SD
Wire Wire Line
	2600 6600 2650 6600
Wire Wire Line
	2600 6700 2650 6700
Wire Notes Line
	900  7650 900  5150
Wire Notes Line
	900  5150 3250 5150
Wire Notes Line
	3250 5150 3250 7650
Wire Notes Line
	3250 7650 900  7650
Text Notes 2500 7600 0    60   ~ 0
HAT ID EEPROM
Text Label 2900 2400 0    60   ~ 0
AUD_L
Text Label 2900 2500 0    60   ~ 0
AUD_R
Wire Wire Line
	2850 2400 2900 2400
Wire Wire Line
	2850 2500 2900 2500
$EndSCHEMATC
