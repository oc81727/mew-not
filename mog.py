import pygame, threading, time

pygame.init()

memory = {}
import numpy as np
import sounddevice as sd






# def decToHex(num, pad=3):
#     return hex(num)[2:].rjust(pad, "0")
def decToHex(x, n = 3):
    # max value for n hex digits
    max_val = 1 << (4 * n)       # 2^(4n)
    if x < 0:
        x = max_val + x          # two's complement
    return f"{x:0{n}X}".lower()          # uppercase hex, zero-padded

def hexToDecU(h):
    # print(f"converting {h} to dec")
    return int(h, 16)

# def hexToDec(h, n):
#     x = int(h, 16)
#     if x >= (1 << (4 * n - 1)):  # if MSB is 1, it's negative
#         x -= 1 << (4 * n)        # convert from two's complement
#     return x
def hexToDec(h):

    # h = h.lstrip("0x").upper()  # remove optional '0x' and normalize
    # print(h)
    n = len(h)                  # number of hex digits
    x = int(h, 16)              # convert to integer

    # number of bits
    bits = n * 4

    # check MSB (most significant bit) for sign
    if x >= (1 << (bits - 1)):
        x -= 1 << bits          # apply two's complement
    return x


def hexToBin(h, i=1):
    return bin(int(h[i:], 16))[2:]


def binToDec(b):
    return int(b, 2)

def binToHex(b, n = 4):
    return hex(int(b, 2))[2:].rjust(n, "0")

for i in range(16 * 16 * 16):
    memory[f"&{decToHex(i)}"] = f"&{decToHex(0, n=4)}"

"""
instruction set

lda
sta
add
sub
jmp
jge
jne
stp

defw
equ

labels
comments




"""

code = """


start lda maxCount
sub counter
jne continue
jmp stop
continue lda counter
add _one
sta counter
jmp start

stop lda counter
sta buzzer
stp





buzzer equ &FFF
counter defw &0
maxCount defw &F
_one defw &1
"""

code2 = """
start lda limit
sub counter
jne loop
jmp stop

loop lda total
add counter
sta total
lda counter
add _one
sta counter
jmp start

stop lda total
sta buzzer
stp

buzzer equ &FFF
counter defw &0001
total defw &0000
limit defw &000A
_one defw &0001


"""

code3 = """
start lda n
sub _one
jne loop
jmp stop

loop lda fib1
add fib2
sta temp
lda fib1
sta fib2
lda temp
sta fib1
lda n
sub _one
sta n
jmp start

stop lda fib1
sta buzzer
stp

buzzer equ &FFF
fib1 defw &0001
fib2 defw &0000
temp defw &0000
n defw &000F
_one defw &0001
"""

code4 = """


lda zero
sta digit5
lda one
sta digit4
lda two
sta digit3
lda three
sta digit2
lda four
sta digit1
lda five
sta digit0
stp


digit5 equ &FFA
digit4 equ &FF9
digit3 equ &FF8
digit2 equ &FF7
digit1 equ &FF6
digit0 equ &FF5
zero defw &0C3F
one defw &0006
two defw &0C09
three defw &008f
four defw &00e6
five defw &00ed

"""
def play_note(freq, duration, samplerate=44100): # ty gpt
    """Play a note asynchronously using a low-latency callback stream."""
    # Total samples to generate
    memory["&ff3"] = "&" + decToHex(1, n=4)
    duration *= 0.1
    total_samples = int(samplerate * duration)
    # A counter inside the closure for tracking progress
    state = {"i": 0}

    def callback(outdata, frames, time, status):
        # if status:
        #     print("Status:", status)

        i = state["i"]
        # Generate the next chunk of samples
        t = (np.arange(i, i + frames) / samplerate)
        samples = np.sin(2 * np.pi * freq * t)

        # Clip at the end of the note
        remaining = total_samples - i
        if remaining <= 0:
            outdata[:] = np.zeros((frames, 1), dtype=np.float32)
            return

        if remaining < frames:
            # Fill only the remaining samples; rest silence
            out_chunk = np.zeros((frames, 1), dtype=np.float32)
            out_chunk[:remaining, 0] = samples[:remaining]
            outdata[:] = out_chunk
            state["i"] = total_samples
            # print("done")
            memory["&ff3"] = "&" + decToHex(0, n=4)
        else:
            outdata[:, 0] = samples.astype(np.float32)
            state["i"] += frames

    # Non-blocking stream
    stream = sd.OutputStream(
        samplerate=samplerate,
        channels=1,
        callback=callback
    )
    stream.start()  # returns immediately (non-blocking)
    return stream  # caller can stop/close if desired



def prepare(code):
    lines = []
    replace = {}
    for i in code.split("\n"):

        if i.strip() != "":
            lines.append(i.strip().lower())

    for line in lines:
        words = line.split(" ")
        if len(words) == 3:
            if words[1] == "equ":
                replace[words[0]] = words[2]

    for n in range(len(lines)):
        words = lines[n].split(" ")
        for x, w in enumerate(words):
            if w in replace:
                words[x] = replace[w]
        lines[n] = " ".join(words)

    prepared = []
    for l in lines:
        if not ("equ" in l):
            prepared.append(l)

    # print(prepared)
    return prepared

labels = {}
def writeMem(lines):
    # labels = {}
    addr = 0
    addrStr = "&000"
    for n, l in enumerate(lines):
        words = l.split(" ")
        # if len(words) == 3:
        if words[0][-1] == ":":
            labels[words[0]] = addrStr
            lines[n] = " ".join(lines[n].split(" ")[1:])
        elif len(words) > 1:
            if words[1] == "defw":
                labels[words[0]] = addrStr
                lines[n] = " ".join(lines[n].split(" ")[1:])
        addr += 1
        addrStr = f"&{decToHex(addr)}"
    print(labels)
    addr = 0
    addrStr = "&000"
    for l in lines:
        # print(l)
        words = l.split(" ")
        # print(words)
        # print(labels)
        for n in range(len(words)):
            if words[n] in labels:
                words[n] = labels[words[n]]
        if len(words) == 1 and words[0] == "stp":
            words.append("&0")
        # if len(words) == 3:
        # 	labels[words[0]] = addrStr
        # 	words.pop(0)
        # print(l)
        # print(words)
        if words[0] == "defw":
            converted = words[1][1:].rjust(4, "0")
            # converted = f"{words[1][1:]:{"0"}>4}"
        else:
            words[1] = words[1][1:].rjust(3, "0")
            converted = opcodes[words[0]] + words[1]

        memory[addrStr] = "&" + converted

        addr += 1
        addrStr = f"&{decToHex(addr)}"
    # print(labels)


def staMem(loc, data):
    memory["&" + loc] = data
    if loc == "ffd":
        buzz(data)


def run(memory, pc, debug=False, step=False):
    quit = False
    acc = 0
    conv = {"0": "lda", "1": "sta", "2": "add", "3": "sub", "4": "jmp", "5": "jge", "6": "jne", "7": "stp"}
    if debug:
        while True:
            # if pc == "&047":
            #     step = True
            if step:
                input()
            # print(memory)
            print("=====new iteration=====")

            mem = memory[pc]
            op = mem[1]
            operand = mem[2:]
            print(f"pc:  {pc} ({hexToDecU(pc[1:])})")
            print(f"op:  {op} ({conv[op]})")
            print(f"opr: {operand} ({hexToDec(operand)})")
            print(f"acc: {acc}")

            if op == "0":
                print(hexToDec(memory["&" + operand][1:]))
                acc = hexToDec(memory["&" + operand][1:])
                print(f"new: {acc}")
            elif op == "1":
                print(f"old: {memory["&" + operand]}")
                # memory["&"+operand] = "&"+decToHex(acc, pad = 4)
                staMem(operand, "&" + decToHex(acc, n=4))
                print(f"new: {memory["&" + operand]}")
            elif op == "2":
                acc += hexToDec(memory["&" + operand][1:])
                print(f"new: {acc}")
            elif op == "3":
                acc -= hexToDec(memory["&" + operand][1:])
                print(f"new: {acc}")
            elif op == "4":
                pc = "&" + operand
                print(f"jmp: {operand}")
                continue
            elif op == "5":
                if acc >= 0:
                    pc = "&" + operand
                    print(f"jmp: {operand}")
                    continue
            elif op == "6":
                if acc != 0:
                    pc = "&" + operand
                    print(f"jmp: {operand}")
                    continue
            elif op == "7":
                break
            pc = "&" + decToHex(hexToDec(pc[1:]) + 1)
            drawBoard(memory)

    else:
        while True:

            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    quit = True
            if quit:
                break

            mem = memory[pc]
            op = mem[1]
            operand = mem[2:]

            if op == "0":
                acc = hexToDec(memory["&" + operand][1:])
            elif op == "1":
                # memory["&"+operand] = "&"+decToHex(acc, pad = 4)
                staMem(operand, "&" + decToHex(acc, n=4))
            elif op == "2":
                acc += hexToDec(memory["&" + operand][1:])
            elif op == "3":
                acc -= hexToDec(memory["&" + operand][1:])
            elif op == "4":
                pc = "&" + operand
                continue
            elif op == "5":
                if acc >= 0:
                    pc = "&" + operand
                    continue
            elif op == "6":
                if acc != 0:
                    pc = "&" + operand
                    continue
            elif op == "7":
                break
            pc = "&" + decToHex(hexToDec(pc[1:]) + 1)
            drawBoard(memory)


    print("completed")
    print(memory)
    printLabels(memory)
    while True:
        if quit:
            break
        drawBoard(memory)


def drawDigit(data):
    surface = pygame.Surface((40, 80))
    surface.fill((200, 200, 200))
    # print(data)
    data = hexToBin(data).rjust(16, "0")[::-1]
    # print(data)

    if data[0] == "1":
        pygame.draw.line(surface, (255, 0, 0), (5, 5), (35, 5), 5)
    else:
        pygame.draw.line(surface, (150, 150, 150), (5, 5), (35, 5), 5)
    if data[1] == "1":
        pygame.draw.line(surface, (255, 0, 0), (35, 5), (35, 38), 5)
    else:
        pygame.draw.line(surface, (150, 150, 150), (35, 5), (35, 38), 5)
    if data[2] == "1":
        pygame.draw.line(surface, (255, 0, 0), (35, 42), (35, 75), 5)
    else:
        pygame.draw.line(surface, (150, 150, 150), (35, 42), (35, 75), 5)
    if data[3] == "1":
        pygame.draw.line(surface, (255, 0, 0), (35, 75), (5, 75), 5)
    else:
        pygame.draw.line(surface, (150, 150, 150), (35, 75), (5, 75), 5)
    if data[4] == "1":
        pygame.draw.line(surface, (255, 0, 0), (5, 75), (5, 42), 5)
    else:
        pygame.draw.line(surface, (150, 150, 150), (5, 75), (5, 42), 5)
    if data[5] == "1":
        pygame.draw.line(surface, (255, 0, 0), (5, 38), (5, 5), 5)
    else:
        pygame.draw.line(surface, (150, 150, 150), (5, 38), (5, 5), 5)
    if data[6] == "1":
        pygame.draw.line(surface, (255, 0, 0), (5, 40), (18, 40), 5)
    else:
        pygame.draw.line(surface, (150, 150, 150), (5, 40), (18, 40), 5)
    if data[7] == "1":
        pygame.draw.line(surface, (255, 0, 0), (22, 40), (35, 40), 5)
    else:
        pygame.draw.line(surface, (150, 150, 150), (22, 40), (35, 40), 5)
    if data[8] == "1":
        pygame.draw.line(surface, (255, 0, 0), (10, 10), (15, 35), 5)
    else:
        pygame.draw.line(surface, (150, 150, 150), (10, 10), (15, 35), 5)
    if data[9] == "1":
        pygame.draw.line(surface, (255, 0, 0), (20, 10), (20, 35), 5)
    else:
        pygame.draw.line(surface, (150, 150, 150), (20, 10), (20, 35), 5)
    if data[10] == "1":
        pygame.draw.line(surface, (255, 0, 0), (30, 10), (25, 35), 5)
    else:
        pygame.draw.line(surface, (150, 150, 150), (30, 10), (25, 35), 5)
    if data[11] == "1":
        pygame.draw.line(surface, (255, 0, 0), (10, 70), (15, 45), 5)
    else:
        pygame.draw.line(surface, (150, 150, 150), (10, 70), (15, 45), 5)
    if data[12] == "1":
        pygame.draw.line(surface, (255, 0, 0), (20, 70), (20, 45), 5)
    else:
        pygame.draw.line(surface, (150, 150, 150), (20, 70), (20, 45), 5)
    if data[13] == "1":
        pygame.draw.line(surface, (255, 0, 0), (30, 70), (25, 45), 5)
    else:
        pygame.draw.line(surface, (150, 150, 150), (30, 70), (25, 45), 5)
    if data[14] == "1":
        pygame.draw.line(surface, (255, 0, 0), (35, 77), (40, 77), 5)
    else:
        pygame.draw.line(surface, (150, 150, 150), (35, 77), (40, 77), 5)

    return surface


def calcFreq(note, octave):
    freq = {"0": 261.63, "1": 277, "2": 293.66, "3": 311, "4": 329.63, "5": 349.23, "6": 370, "7": 392, "8": 415,
            "9": 440, "10": 466, "11": 493}
    tone = freq[str(note)] * 2 ** (octave - 4)
    return tone


# semitones = (octave - 4) * 12 + (note - 9)
# return 440 * 2 ** (semitones / 12)

def buzz(data):
    data = hexToBin(data[1:], 0).ljust(16, "0")
    note = binToDec(data[12:16])
    octave = binToDec(data[8:12])
    duration = binToDec(data[4:8])
    mode = binToDec(data[0])
    if mode == 0:
        # print("direct")
        return
    if note > 11:
        # print("invalid note")
        return
    if octave < 4 or octave > 8:
        octave = 8
    # print(f"note: {note}")
    # print(f"octave: {octave}")
    # print(f"duration: {duration}")
    # threading.Thread(target=lambda:play_note(calcFreq(note,octave), duration)).start()
    # play_note(calcFreq(note, octave), duration)
    play_note(calcFreq(note, octave), duration)
    # player.play_note_async(calcFreq(note, octave), duration, on_finish=done)

class Button:
    def __init__(self, x, y, w, h, text, font, bg=(200,200,200), fg=(0,0,0)):
        self.rect = pygame.Rect(x, y, w, h)
        self.text = text
        self.font = font
        self.bg = bg
        self.fg = fg
        self.hovered = False

        self.text_surf = font.render(text, True, fg)
        self.text_rect = self.text_surf.get_rect(center=self.rect.center)

    def draw(self, screen):
        color = (180,180,180) if self.hovered else self.bg
        pygame.draw.rect(screen, color, self.rect, border_radius=6)
        screen.blit(self.text_surf, self.text_rect)

    def update(self):

        mouse_pos = pygame.mouse.get_pos()
        self.hovered = self.rect.collidepoint(mouse_pos)

        mouse_pressed = pygame.mouse.get_pressed(num_buttons=3)
        if mouse_pressed[0] and self.hovered:
            sBC[self.text] = 1
        else:
            sBC[self.text] = 0

    def is_clicked(self, event):
        # Check if this event is a click on the button
        return event.type == pygame.MOUSEBUTTONDOWN and event.button == 1 and self.hovered

sBC = {}
def drawBoard(memory):
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False


    screen.fill((10, 150, 10))
    trafficLights = memory["&fff"]
    buzzer = memory["&ffd"]
    digit5 = memory["&ffa"]
    digit4 = memory["&ff9"]
    digit3 = memory["&ff8"]
    digit2 = memory["&ff7"]
    digit1 = memory["&ff6"]
    digit0 = memory["&ff5"]
    s7leds = memory["&ff4"]
    buzzerBusy = memory["&ff3"]
    keypad = memory["&ff2"]
    buttonA2H = memory["&ff1"]
    buttonSimple = memory["&ff0"]

    d5 = drawDigit(digit5)
    screen.blit(d5, (90, 80))
    d4 = drawDigit(digit4)
    screen.blit(d4, (140, 80))
    d3 = drawDigit(digit3)
    screen.blit(d3, (190, 80))
    d2 = drawDigit(digit2)
    screen.blit(d2, (240, 80))
    d1 = drawDigit(digit1)
    screen.blit(d1, (290, 80))
    d0 = drawDigit(digit0)
    screen.blit(d0, (340, 80))






    simpleA.update()
    simpleA.draw(screen)
    simpleB.update()
    simpleB.draw(screen)
    simpleC.update()
    simpleC.draw(screen)
    simpleD.update()
    simpleD.draw(screen)
    simpleE.update()
    simpleE.draw(screen)
    simpleF.update()
    simpleF.draw(screen)
    simpleG.update()
    simpleG.draw(screen)
    simpleH.update()
    simpleH.draw(screen)

    kp1.update()
    kp1.draw(screen)
    kp2.update()
    kp2.draw(screen)
    kp3.update()
    kp3.draw(screen)
    kp4.update()
    kp4.draw(screen)
    kp5.update()
    kp5.draw(screen)
    kp6.update()
    kp6.draw(screen)
    kp7.update()
    kp7.draw(screen)
    kp8.update()
    kp8.draw(screen)
    kp9.update()
    kp9.draw(screen)
    kp0.update()
    kp0.draw(screen)
    kpa.update()
    kpa.draw(screen)
    kpb.update()
    kpb.draw(screen)
    kpc.update()
    kpc.draw(screen)
    kpd.update()
    kpd.draw(screen)
    kpe.update()
    kpe.draw(screen)
    kpf.update()
    kpf.draw(screen)

    # print()
    staMem("ff1", "&"+binToHex(f"{sBC["H"]}{sBC["G"]}{sBC["F"]}{sBC["E"]}{sBC["D"]}{sBC["C"]}{sBC["B"]}{sBC["A"]}"))
    # print(memory["&ff1"])
    staMem("ff2","&"+binToHex(f"{sBC["f"]}{sBC["e"]}{sBC["d"]}{sBC["c"]}{sBC["b"]}{sBC["a"]}{sBC["9"]}{sBC["8"]}{sBC["7"]}{sBC["6"]}{sBC["5"]}{sBC["4"]}{sBC["3"]}{sBC["2"]}{sBC["1"]}{sBC["0"]}"))
    # print(memory["&ff2"])

    pygame.display.update()


# buzz(buzzer, memory)


opcodes = {"lda": "0", "sta": "1", "add": "2", "sub": "3", "jmp": "4", "jge": "5", "jne": "6", "stp": "7"}

code5 = """


start lda buzzerbusy
jne start
lda note
sta buzzer
jmp start



buzzer equ &ffd
buzzerbusy equ &ff3
note defw &8100
"""

code6 = """

wait0 lda buzzerBusy
jne wait0
lda note0
sta buzzer
wait1 lda buzzerBusy
jne wait1
lda note1
sta buzzer
wait2 lda buzzerBusy
jne wait2
lda note2
sta buzzer
wait3 lda buzzerBusy
jne wait3
lda note3
sta buzzer
wait4 lda buzzerBusy
jne wait4
lda note4
sta buzzer
wait5 lda buzzerBusy
jne wait5
lda note5
sta buzzer
wait6 lda buzzerBusy
jne wait6
lda note6
sta buzzer
wait7 lda buzzerBusy
jne wait7
lda note7
sta buzzer
wait8 lda buzzerBusy
jne wait8
lda note8
sta buzzer
wait9 lda buzzerBusy
jne wait9
lda note9
sta buzzer
wait10 lda buzzerBusy
jne wait10
lda note10
sta buzzer
wait11 lda buzzerBusy
jne wait11
lda note11
sta buzzer
wait12 lda buzzerBusy
jne wait12
lda note12
sta buzzer
wait13 lda buzzerBusy
jne wait13
lda note13
sta buzzer
wait14 lda buzzerBusy
jne wait14
lda note14
sta buzzer
wait15 lda buzzerBusy
jne wait15
lda note15
sta buzzer
wait16 lda buzzerBusy
jne wait16
lda note16
sta buzzer
wait17 lda buzzerBusy
jne wait17
lda note17
sta buzzer
wait18 lda buzzerBusy
jne wait18
lda note18
sta buzzer
wait19 lda buzzerBusy
jne wait19
lda note19
sta buzzer
wait20 lda buzzerBusy
jne wait20
lda note20
sta buzzer
wait21 lda buzzerBusy
jne wait21
lda note21
sta buzzer
wait22 lda buzzerBusy
jne wait22
lda note22
sta buzzer
wait23 lda buzzerBusy
jne wait23
lda note23
sta buzzer
wait24 lda buzzerBusy
jne wait24
lda note24
sta buzzer
wait25 lda buzzerBusy
jne wait25
lda note25
sta buzzer
wait26 lda buzzerBusy
jne wait26
lda note26
sta buzzer
wait27 lda buzzerBusy
jne wait27
lda note27
sta buzzer
wait28 lda buzzerBusy
jne wait28
lda note28
sta buzzer
wait29 lda buzzerBusy
jne wait29
lda note29
sta buzzer
wait30 lda buzzerBusy
jne wait30
lda note30
sta buzzer
wait31 lda buzzerBusy
jne wait31
lda note31
sta buzzer
wait32 lda buzzerBusy
jne wait32
lda note32
sta buzzer
wait33 lda buzzerBusy
jne wait33
lda note33
sta buzzer
wait34 lda buzzerBusy
jne wait34
lda note34
sta buzzer
wait35 lda buzzerBusy
jne wait35
lda note35
sta buzzer
wait36 lda buzzerBusy
jne wait36
lda note36
sta buzzer
wait37 lda buzzerBusy
jne wait37
lda note37
sta buzzer
wait38 lda buzzerBusy
jne wait38
lda note38
sta buzzer
wait39 lda buzzerBusy
jne wait39
lda note39
sta buzzer
wait40 lda buzzerBusy
jne wait40
lda note40
sta buzzer
wait41 lda buzzerBusy
jne wait41
lda note41
sta buzzer
wait42 lda buzzerBusy
jne wait42
lda note42
sta buzzer
wait43 lda buzzerBusy
jne wait43
lda note43
sta buzzer
wait44 lda buzzerBusy
jne wait44
lda note44
sta buzzer
wait45 lda buzzerBusy
jne wait45
lda note45
sta buzzer
wait46 lda buzzerBusy
jne wait46
lda note46
sta buzzer
wait47 lda buzzerBusy
jne wait47
lda note47
sta buzzer
wait48 lda buzzerBusy
jne wait48
lda note48
sta buzzer
wait49 lda buzzerBusy
jne wait49
lda note49
sta buzzer
wait50 lda buzzerBusy
jne wait50
lda note50
sta buzzer
wait51 lda buzzerBusy
jne wait51
lda note51
sta buzzer
wait52 lda buzzerBusy
jne wait52
lda note52
sta buzzer
wait53 lda buzzerBusy
jne wait53
lda note53
sta buzzer
wait54 lda buzzerBusy
jne wait54
lda note54
sta buzzer
wait55 lda buzzerBusy
jne wait55
lda note55
sta buzzer
wait56 lda buzzerBusy
jne wait56
lda note56
sta buzzer
wait57 lda buzzerBusy
jne wait57
lda note57
sta buzzer
wait58 lda buzzerBusy
jne wait58
lda note58
sta buzzer
wait59 lda buzzerBusy
jne wait59
lda note59
sta buzzer
wait60 lda buzzerBusy
jne wait60
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


"""

def printLabels(memory):
    for i in labels:
        print(f"{i}: {memory[labels[i]]} ({hexToDec(memory[labels[i]][1:])})")

screen = pygame.display.set_mode((800, 600))

font = pygame.font.Font(None, 32)
simpleA = Button(20,500,30, 30, "A", font)
simpleB = Button(70,500,30, 30, "B", font)
simpleC = Button(120,500,30, 30, "C", font)
simpleD = Button(170,500,30, 30, "D", font)
simpleE = Button(220,500,30, 30, "E", font)
simpleF = Button(270,500,30, 30, "F", font)
simpleG = Button(320,500,30, 30, "G", font)
simpleH = Button(370,500,30, 30, "H", font)

kp1 = Button(100,200,35, 35, "1", font)
kp2 = Button(150,200,35, 35, "2", font)
kp3 = Button(200,200,35, 35, "3", font)
kpf = Button(250,200,35, 35, "f", font)
kp4 = Button(100,250,35, 35, "4", font)
kp5 = Button(150,250,35, 35, "5", font)
kp6 = Button(200,250,35, 35, "6", font)
kpe = Button(250,250,35, 35, "e", font)
kp7 = Button(100,300,35, 35, "7", font)
kp8 = Button(150,300,35, 35, "8", font)
kp9 = Button(200,300,35, 35, "9", font)
kpd = Button(250,300,35, 35, "d", font)
kpa = Button(100,350,35, 35, "a", font)
kp0 = Button(150,350,35, 35, "0", font)
kpb = Button(200,350,35, 35, "b", font)
kpc = Button(250,350,35, 35, "c", font)


with open("black_jack.s","r") as f:
    prepared = prepare(f.read())

# print(prepared)
writeMem(prepared)
print(memory)

run(memory, "&000")


