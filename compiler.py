end = """
stp

buzzer EQU &FFD
buzzerBusy EQU &FF3

"""

def genWait(num):
	return f"""wait{num} lda buzzerBusy
jne wait{num}
"""

def genNoteHex(note, octave, duration):
	#val = 32765 #bit 15 is 1
	#val += 256 * duration #bit 8
	#val += 16 * octave #bit 4
	#val += note
	#return hex(val)[2:]
	octBin = bin(octave)[2:].rjust(4,"0")
	durBin = bin(duration)[2:].rjust(4,"0")
	noteBin = bin(note)[2:].rjust(4,"0")
	
	ret =  hex(int(f"1000{durBin}{octBin}{noteBin}", 2))[2:]
	print(ret)
	return ret


def genPlay(num):
	return f"""lda note{num}
sta buzzer
"""
def addNote(num, hexStr):
	global data
	data += f"note{num} defw &{hexStr}\n"

notes = [[0,4,5], [2,4,5], [4,4,5], [5,4,5],[7,4,5],[9,4,5],[11,4,5], [0,5,5]]

notes2 = []
def cNote(note,oct,dur):
	notes2.append([note,oct,dur])


conv = {"c":0,"c#":1,"d":2,"d#":3,"e":4,"f":5,"f#":6,"g":7,"g#":8,"a":9,"a#":10,"b":11}

def cN(note,oct,dur):
	notes2.append([conv[note],oct,dur*2])

#harry potter theme
"""
cNote(11,4,3)
cNote(4,5,6)
cNote(7,5,3)
cNote(6,5,3)
cNote(4,5,6)
cNote(11,5,3)
cNote(10,5,9)
cNote(6,5,9)

cNote(4,5,6)
cNote(7,5,3)
cNote(6,5,3)
cNote(3,5,6)
cNote(5,5,3)
cNote(11,4,12)


cNote(11,4,3)
cNote(4,5,6)
cNote(7,5,3)
cNote(6,5,3)
cNote(4,5,6)
cNote(11,5,3)
cNote(2,6,6)
cNote(1,6,3)
cNote(0,6,6)

"""
#star wars theme
cN("d",5,1)
cN("d",5,1)
cN("d",5,1)
cN("g",5,6)
cN("d",6,6)
cN("c",6,1)
cN("b",5,1)
cN("a",5,1)
cN("g",6,6)

cN("d",6,3)
cN("c",6,1)
cN("b",5,1)
cN("a",5,1)
cN("g",6,6)
cN("d",6,3)

cN("c",6,1)
cN("b",5,1)
cN("c",6,1)
cN("a",5,6)

cN("c",5,2)
cN("c",5,1)

cN("g",5,6)
cN("d",6,6)
cN("c",6,1)
cN("b",5,1)
cN("a",5,1)
cN("g",6,6)

cN("d",6,3)
cN("c",6,1)
cN("b",5,1)
cN("a",5,1)
cN("g",6,6)
cN("d",6,3)

cN("c",6,1)
cN("b",5,1)
cN("c",6,1)
cN("a",5,6)

cN("d",5,2)
cN("d",5,1)
cN("e",5,2)
cN("e",5,1)
cN("c",6,1)
cN("b",5,1)
cN("a",5,1)
cN("g",5,1)

cN("g",5,1)
cN("a",5,1)
cN("b",5,1)
cN("a",5,2)
cN("e",5,1)
cN("f#",5,3)

cN("d",5,2)
cN("d",5,1)
cN("e",5,2)
cN("e",5,1)
cN("c",6,1)
cN("b",5,1)
cN("a",5,1)
cN("g",5,1)
cN("d",6,3)
cN("a",5,6)


final = ""

data = ""
string = ""
for n,i in enumerate(notes2):
	string += genWait(n)
	string += genPlay(n)
	hexStr = genNoteHex(*i)
	addNote(n, hexStr)


string += end
string += data
print(string)

with open("compiled.s", "w") as f:
	f.write(string)
