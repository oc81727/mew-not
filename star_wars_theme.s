wait0: lda buzzerBusy
jne wait0:
lda note0
sta buzzer
wait1: lda buzzerBusy
jne wait1:
lda note1
sta buzzer
wait2: lda buzzerBusy
jne wait2:
lda note2
sta buzzer
wait3: lda buzzerBusy
jne wait3:
lda note3
sta buzzer
wait4: lda buzzerBusy
jne wait4:
lda note4
sta buzzer
wait5: lda buzzerBusy
jne wait5:
lda note5
sta buzzer
wait6: lda buzzerBusy
jne wait6:
lda note6
sta buzzer
wait7: lda buzzerBusy
jne wait7:
lda note7
sta buzzer
wait8: lda buzzerBusy
jne wait8:
lda note8
sta buzzer
wait9: lda buzzerBusy
jne wait9:
lda note9
sta buzzer
wait10: lda buzzerBusy
jne wait10:
lda note10
sta buzzer
wait11: lda buzzerBusy
jne wait11:
lda note11
sta buzzer
wait12: lda buzzerBusy
jne wait12:
lda note12
sta buzzer
wait13: lda buzzerBusy
jne wait13:
lda note13
sta buzzer
wait14: lda buzzerBusy
jne wait14:
lda note14
sta buzzer
wait15: lda buzzerBusy
jne wait15:
lda note15
sta buzzer
wait16: lda buzzerBusy
jne wait16:
lda note16
sta buzzer
wait17: lda buzzerBusy
jne wait17:
lda note17
sta buzzer
wait18: lda buzzerBusy
jne wait18:
lda note18
sta buzzer
wait19: lda buzzerBusy
jne wait19:
lda note19
sta buzzer
wait20: lda buzzerBusy
jne wait20:
lda note20
sta buzzer
wait21: lda buzzerBusy
jne wait21:
lda note21
sta buzzer
wait22: lda buzzerBusy
jne wait22:
lda note22
sta buzzer
wait23: lda buzzerBusy
jne wait23:
lda note23
sta buzzer
wait24: lda buzzerBusy
jne wait24:
lda note24
sta buzzer
wait25: lda buzzerBusy
jne wait25:
lda note25
sta buzzer
wait26: lda buzzerBusy
jne wait26:
lda note26
sta buzzer
wait27: lda buzzerBusy
jne wait27:
lda note27
sta buzzer
wait28: lda buzzerBusy
jne wait28:
lda note28
sta buzzer
wait29: lda buzzerBusy
jne wait29:
lda note29
sta buzzer
wait30: lda buzzerBusy
jne wait30:
lda note30
sta buzzer
wait31: lda buzzerBusy
jne wait31:
lda note31
sta buzzer
wait32: lda buzzerBusy
jne wait32:
lda note32
sta buzzer
wait33: lda buzzerBusy
jne wait33:
lda note33
sta buzzer
wait34: lda buzzerBusy
jne wait34:
lda note34
sta buzzer
wait35: lda buzzerBusy
jne wait35:
lda note35
sta buzzer
wait36: lda buzzerBusy
jne wait36:
lda note36
sta buzzer
wait37: lda buzzerBusy
jne wait37:
lda note37
sta buzzer
wait38: lda buzzerBusy
jne wait38:
lda note38
sta buzzer
wait39: lda buzzerBusy
jne wait39:
lda note39
sta buzzer
wait40: lda buzzerBusy
jne wait40:
lda note40
sta buzzer
wait41: lda buzzerBusy
jne wait41:
lda note41
sta buzzer
wait42: lda buzzerBusy
jne wait42:
lda note42
sta buzzer
wait43: lda buzzerBusy
jne wait43:
lda note43
sta buzzer
wait44: lda buzzerBusy
jne wait44:
lda note44
sta buzzer
wait45: lda buzzerBusy
jne wait45:
lda note45
sta buzzer
wait46: lda buzzerBusy
jne wait46:
lda note46
sta buzzer
wait47: lda buzzerBusy
jne wait47:
lda note47
sta buzzer
wait48: lda buzzerBusy
jne wait48:
lda note48
sta buzzer
wait49: lda buzzerBusy
jne wait49:
lda note49
sta buzzer
wait50: lda buzzerBusy
jne wait50:
lda note50
sta buzzer
wait51: lda buzzerBusy
jne wait51:
lda note51
sta buzzer
wait52: lda buzzerBusy
jne wait52:
lda note52
sta buzzer
wait53: lda buzzerBusy
jne wait53:
lda note53
sta buzzer
wait54: lda buzzerBusy
jne wait54:
lda note54
sta buzzer
wait55: lda buzzerBusy
jne wait55:
lda note55
sta buzzer
wait56: lda buzzerBusy
jne wait56:
lda note56
sta buzzer
wait57: lda buzzerBusy
jne wait57:
lda note57
sta buzzer
wait58: lda buzzerBusy
jne wait58:
lda note58
sta buzzer
wait59: lda buzzerBusy
jne wait59:
lda note59
sta buzzer
wait60: lda buzzerBusy
jne wait60:
lda note60
sta buzzer

stp

buzzer EQU &FFD
buzzerBusy EQU &FF3

note0 defw &8252
note1 defw &8252
note2 defw &8252
note3 defw &8c57
note4 defw &8c62
note5 defw &8260
note6 defw &825b
note7 defw &8259
note8 defw &8c67
note9 defw &8662
note10 defw &8260
note11 defw &825b
note12 defw &8259
note13 defw &8c67
note14 defw &8662
note15 defw &8260
note16 defw &825b
note17 defw &8260
note18 defw &8c59
note19 defw &8450
note20 defw &8250
note21 defw &8c57
note22 defw &8c62
note23 defw &8260
note24 defw &825b
note25 defw &8259
note26 defw &8c67
note27 defw &8662
note28 defw &8260
note29 defw &825b
note30 defw &8259
note31 defw &8c67
note32 defw &8662
note33 defw &8260
note34 defw &825b
note35 defw &8260
note36 defw &8c59
note37 defw &8452
note38 defw &8252
note39 defw &8454
note40 defw &8254
note41 defw &8260
note42 defw &825b
note43 defw &8259
note44 defw &8257
note45 defw &8257
note46 defw &8259
note47 defw &825b
note48 defw &8459
note49 defw &8254
note50 defw &8656
note51 defw &8452
note52 defw &8252
note53 defw &8454
note54 defw &8254
note55 defw &8260
note56 defw &825b
note57 defw &8259
note58 defw &8257
note59 defw &8662
note60 defw &8c59
