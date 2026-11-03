"""
syntax

@ to access variables
% to create variable
nothing after % define defaults to 0

have to create a variable before it can be used

%var 123
%data2
%data3
%data4
then
@var = @data2 + @data3 - @data4

same as

lda data2
add data3
sub data4
sta var

stp

var defw &whatever 123 is in hex
data2 defw &...
data3 defw &...
...


~ for labels

[ ] to define function
: to call functions
recursion or functions in functions not allowed
^ to define parameters and variables used in function
^ret is predefined by default



%_one 1

[ multiply
^v1
^v2
^count

^count = ^v1
~ start
^v1 = ^v1 + ^v2
^count = ^count - @_one
if (^count ge)
goto start
endif
^ret = ^v1

]

%_three 3
%_four 4
%_five 5
%result
:multiply @_three @_four
@result = @ret
:multiply @_result @_five
@result = @ret


same as


lda _three
sta multiply_v1
lda _four
sta multiply_v2




lda multiply_v1  #first call
sta multiply_count

1_multiply_start lda multiply_v1
add multiply_v2
sta multiply_v1
lda multiply_count
sub _one
sta multiply_count
                <----------optimisation
lda multiply_count
jge 1_multiply_if_1
jmp 1_multiply_endif_1
1_multiply_if_1 jmp 1_multiply_start
1_multiply_endif_1 lda multiply_v1
sta ret
                <----------optimisation?
lda ret
sta result




lda result
sta multiply_v1
lda _five
sta multiply_v2







lda multiply_v1  #second call
sta multiply_count

2_multiply_start lda multiply_v1
add multiply_v2
sta multiply_v1
lda multiply_count
sub _one
sta multiply_count

lda multiply_count
jge 2_multiply_if_1
jmp 2_multiply_endif_1
2_multiply_if_1 jmp 2_multiply_start
2_multiply_endif_1 lda multiply_v1
sta ret

lda ret
sta result








ret defw &0000

_three defw &0003
_four defw &0004
_five defw &0005
result defw &0000

multiply_v1 defw &0000
multiply_v2 defw &0000
multiply_count defw &0000






if statements:

if @var1 comparison @var2
...
endif

comparisons:
==
>=
>
<=
<
!=



=> to write to specific location

@var => fff

lda var
sta &fff



? for memory location replacements
?digit0 ff5
...
@zero_char => ?digit0

display characters:

0 - 3135
1 - 1030
2 - 219
3 - 207
4 - 230
5 - 237
6 - 253
7 - 3073
8 - 255
9 - 239

A -

memory map:

digit 0 - ff5
digit 1 - ff6
digit 2 - ff7
digit 3 - ff8
digit 4 - ff9
digit 5 - ffa

buzzer - ffd
buzzer busy - ff3
A - H buttons - ff1
keypad - ff2



"""



def functionCompileIf(name, endIfNum, l):
    global ifNum
    print("compiling function if statement")
    startL = l
    ifNum += 1
    ifCompiled = []
    ifLine = lines[l]
    l += 1
    while True:
        line = lines[l]
        words = line.split()

        # compiling arithmetic and assignments
        if len(words) >= 3 and len(words) % 2 == 1:

            if words[1] == "=>":
                if words[0][0] == "^":
                    ifCompiled.append(f"lda {name}_{words[0][1:]}")
                elif words[0][0] == "@":
                    ifCompiled.append(f"lda {words[0][1:]}")
                ifCompiled.append(f"sta &{words[2]}")
            else:
                # print(words)

                if words[2][0] == "^":
                    if words[0] != "^ret":
                        # print("here")
                        ifCompiled.append(f"lda {name}_{words[2][1:]}")    # bug maybe idk
                        # print(ifCompiled)
                    else:
                        ifCompiled.append(f"lda ^ret")
                elif words[2][0] == "@":
                    ifCompiled.append(f"lda {words[2][1:]}")
                else:
                    if not words[2] in numConsts:
                        numConsts.append(words[2])
                    ifCompiled.append(f"lda {numToText(words[2])}")

            n = 3
            # arithmetic
            while n < len(words) - 1:
                if words[n] == "+":
                    if words[n + 1][0] == "^":
                        ifCompiled.append(f"add {name}_{words[n + 1][1:]}")
                    elif words[n + 1][0] == "@":
                        ifCompiled.append(f"add {words[n + 1][1:]}")
                    else:
                        if not words[n + 1] in numConsts:
                            numConsts.append(words[n + 1])
                        ifCompiled.append(f"add {numToText(words[n + 1])}")
                elif words[n] == "-":
                    if words[n + 1][0] == "^":
                        ifCompiled.append(f"sub {name}_{words[n + 1][1:]}")
                    elif words[n + 1][0] == "@":
                        ifCompiled.append(f"sub {words[n + 1][1:]}")
                    else:
                        if not words[n + 1] in numConsts:
                            numConsts.append(words[n + 1])
                        ifCompiled.append(f"sub {numToText(words[n + 1])}")
                else:
                    raise Exception(line)
                n += 2
            if words[0][0] == "^":
                if words[0] != "^ret":
                    ifCompiled.append(f"sta {name}_{words[0][1:]}")
                else:
                    ifCompiled.append(f"sta ^ret")
            elif words[0][0] == "@":
                ifCompiled.append(f"sta {words[0][1:]}")

        # labels
        elif words[0] == "~":
            ifCompiled.append(f"{name}_{words[1]}:")
            # ifCompiled.append(f"sta &ff0")
        # goto
        elif words[0] == "goto":
            ifCompiled.append(f"jmp {name}_{words[1]}:")
        elif words[0] == "if":
            ifRet, skipDist = functionCompileIf(name, ifNum, l)
            ifCompiled += ifRet
            l += skipDist
        elif words[0] == "endif":
            break
        # function calls
        elif words[0][0] == ":":
            ifCompiled.append(f"SPAWNFUNCTION {words[0][1:]}")

        l += 1

    #end of if statement

    words = ifLine.split()


    if words[1][0] == "?":
        var1 = f"&{replacements[words[1]]}"
    else:
        if words[1][0] == "^":
            var1 = f"{name}_{words[1][1:]}"
        elif words[1][0] == "@":
            var1 = f"{words[1][1:]}"

    # print(words)
    if words[3][0] == "?":
        var2 = f"&{replacements[words[3]]}"
    else:
        if words[3][0] == "^":
            var2 = f"{name}_{words[3][1:]}"
        elif words[3][0] == "@":
            var2 = f"{words[3][1:]}"
        else:
            if not words[3] in numConsts:
                numConsts.append(words[3])
            var2 = f"{numToText(words[3])}"






    comparison = words[2]
    if comparison == "==":
        # a - b != 0 then skip
        ifCompiled = [f"lda {var1}",
         f"sub {var2}",
         f"jne {name}_endif_{endIfNum}:"] + ifCompiled
    elif comparison == "!=":
        # a-b >= 0 and b-a >= 0 then skip
        ifCompiled = [f"lda {var1}",
         f"sub {var2}",
         f"jge {name}_if_{endIfNum}_check:",
         f"jmp {name}_if_{endIfNum}_start:",
         f"{name}_if_{endIfNum}_check:",
         f"lda {var2}",
         f"sub {var1}",
         f"jge {name}_endif_{endIfNum}:",
         f"{name}_if_{endIfNum}_start:"] + ifCompiled
    elif comparison == ">=":
        # (b - a) >= 0 AND (b - a) != 0 then skip
        ifCompiled = [f"lda {var2}",
         f"sub {var1}",
         f"jge {name}_if_{endIfNum}_check:",
         f"jmp {name}_if_{endIfNum}_start:",
         f"{name}_if_{endIfNum}_check:",
#         f"lda {var2}",   # skipping because repeated
#         f"sub {var1}",
         f"jne {name}_endif_{endIfNum}:",
         f"{name}_if_{endIfNum}_start:"] + ifCompiled
    elif comparison == ">":
        # (b - a) >= 0 then skip
        ifCompiled = [f"lda {var2}",
         f"sub {var1}",
         f"jge {name}_endif_{endIfNum}:"] + ifCompiled
    elif comparison == "<=":
        # (a - b) >= 0 AND (a - b) != 0 then skip
        ifCompiled = [f"lda {var1}",
         f"sub {var2}",
         f"jge {name}_if_{endIfNum}_check:",
         f"jmp {name}_if_{endIfNum}_start:",
         f"{name}_if_{endIfNum}_check:",
#         f"lda {var1}",    # skipping because repeated
#         f"sub {var2}",
         f"jne {name}_endif_{endIfNum}:",
         f"{name}_if_{endIfNum}_start:"] + ifCompiled
    elif comparison == "<":
        # (a - b) >= 0 then skip
        ifCompiled = [f"lda {var1}",
         f"sub {var2}",
         f"jge {name}_endif_{endIfNum}:"] + ifCompiled

    ifCompiled.append(f"{name}_endif_{endIfNum}:")
    # ifCompiled.append(f"sta &ff0")

    # print("compiled an if!")
    # print(ifCompiled)

    return ifCompiled, l-startL


def mainCompileIf(endIfNum, l):
    global ifNum
    print("compiling main if statement")
    startL = l
    ifNum += 1
    ifCompiled = []
    ifLine = lines[l]
    l += 1
    while True:
        line = lines[l]
        words = line.split()

        # compiling arithmetic and assignments
        if len(words) >= 3 and len(words) % 2 == 1:

            if words[1] == "=>":
                ifCompiled.append(f"lda {words[0][1:]}")
                ifCompiled.append(f"sta &{words[2]}")
            else:
                if words[2][0] != "@":
                    if not words[2] in numConsts:
                        numConsts.append(words[2])
                    ifCompiled.append(f"lda {numToText(words[2])}")
                else:
                    ifCompiled.append(f"lda {words[2][1:]}")

                n = 3
                # arithmetic
                while n < len(words) - 1:
                    if words[n] == "+":
                        if words[n+1][1] != "@":
                            if not words[n + 1] in numConsts:
                                numConsts.append(words[n + 1])
                            ifCompiled.append(f"add {numToText(words[n + 1])}")
                        else:
                            ifCompiled.append(f"add {words[n + 1][1:]}")
                    elif words[n] == "-":
                        if words[n+1][1] != "@":
                            if not words[n + 1] in numConsts:
                                numConsts.append(words[n + 1])
                            ifCompiled.append(f"sub {numToText(words[n + 1])}")
                        else:
                            ifCompiled.append(f"sub {words[n + 1][1:]}")
                    else:
                        raise Exception(line)
                    n += 2
                ifCompiled.append(f"sta {words[0][1:]}")
        # labels
        elif words[0] == "~":
            ifCompiled.append(f"{words[1]}:")
            # ifCompiled.append(f"sta &ff0")
        # goto
        elif words[0] == "goto":
            ifCompiled.append(f"jmp {words[1]}:")
        elif words[0] == "if":
            ifRet, skipDist = mainCompileIf(ifNum, l)
            ifCompiled += ifRet
            l += skipDist
        elif words[0] == "endif":
            break
        # function calls
        elif words[0][0] == ":":
            ifCompiled.apppend(f"SPAWNFUNCTION {words[0][1:]}")

        l += 1

    # end of if statement

    words = ifLine.split()

    # print(words)
    if words[1][0] == "?":
        var1 = f"&{replacements[words[1]]}"
    else:
        var1 = f"{words[1][1:]}"

    if words[3][0] == "?":
        var2 = f"&{replacements[words[3]]}"
    elif words[3][0] == "@":
        var2 = f"{words[3][1:]}"
    else:
        if not words[3] in numConsts:
            numConsts.append(words[3])
        var2 = f"{numToText(words[3])}"


    comparison = words[2]
    if comparison == "==":
        # a - b != 0 then skip
        ifCompiled = [f"lda {var1}",
                      f"sub {var2}",
                      f"jne main_endif_{endIfNum}:"] + ifCompiled
    elif comparison == "!=":
        # a-b >= 0 and b-a >= 0 then skip
        ifCompiled = [f"lda {var1}",
                      f"sub {var2}",
                      f"jge main_if_{endIfNum}_check:",
                      f"jmp main_if_{endIfNum}_start:",
                      f"main_if_{endIfNum}_check:",
                      f"lda {var2}",
                      f"sub {var1}",
                      f"jge main_endif_{endIfNum}:",
                      f"main_if_{endIfNum}_start:"] + ifCompiled
    elif comparison == ">=":
        # (b - a) >= 0 AND (b - a) != 0 then skip
        ifCompiled = [f"lda {var2}",
                      f"sub {var1}",
                      f"jge main_if_{endIfNum}_check:",
                      f"jmp main_if_{endIfNum}_start:",
                      f"main_if_{endIfNum}_check:",
                      #         f"lda {var2}",   # skipping because repeated
                      #         f"sub {var1}",
                      f"jne main_endif_{endIfNum}:",
                      f"main_if_{endIfNum}_start:"] + ifCompiled
    elif comparison == ">":
        # (b - a) >= 0 then skip
        ifCompiled = [f"lda {var2}",
                      f"sub {var1}",
                      f"jge main_endif_{endIfNum}:"] + ifCompiled
    elif comparison == "<=":
        # (a - b) >= 0 AND (a - b) != 0 then skip
        ifCompiled = [f"lda {var1}",
                      f"sub {var2}",
                      f"jge main_if_{endIfNum}_check:",
                      f"jmp main_if_{endIfNum}_start:",
                      f"main_if_{endIfNum}_check:",
                      #         f"lda {var1}",    # skipping because repeated
                      #         f"sub {var2}",
                      f"jne main_endif_{endIfNum}:",
                      f"main_if_{endIfNum}_start:"] + ifCompiled
    elif comparison == "<":
        # (a - b) >= 0 then skip
        ifCompiled = [f"lda {var1}",
                      f"sub {var2}",
                      f"jge main_endif_{endIfNum}:"] + ifCompiled

    ifCompiled.append(f"main_endif_{endIfNum}:")
    # ifCompiled.append(f"sta &ff0")

    # print("compiled an if!")
    # print(ifCompiled)

    return ifCompiled, l - startL


with open("code2.txt", "r") as f:
    lines_u = [l.strip() for l in f.read().splitlines()]

lines = []
print("removing empty lines")
for line in lines_u:
    if len(line) != 0:
        lines.append(line)

# print(lines)

# initial pass to define variables?

def numToText(num):
    conv = {"0": "zero", "1": "one", "2": "two", "3": "three", "4": "four", "5": "five", "6": "six", "7": "seven", "8": "eight", "9": "nine"}
    s = ""
    for i in str(num):
        s += conv[i]
    return s

variables = {}
numConsts = []

print("defining variables")
for line in lines:
    words = line.split()
    if words[0][0]=="%":
        if len(words) > 2:
            raise Exception(line)
        elif len(words) == 2:
            variables[words[0][1:]] = words[1]
        else:
            variables[words[0][1:]] = 0


# initialising function variables
#
# for line in lines:
#     words = line.split()
#     if words[0][0]=="^" and len(words) == 1:
#         variables[words[0]] = 0

print("memory location replacements")
replacements = {}
for line in lines:
    words = line.split()
    if words[0][0]=="?":
        replacements[words[0]] = words[1]
while True:
    removed = False
    for l in range(len(lines)):
        if lines[l][0] == "?":
            lines.pop(l)
            removed = True
            break
    if not removed:
        break
for l in range(len(lines)):
    words = lines[l].split()
    if words[0] != "if":
        for w in range(len(words)):
            if words[w] in replacements:
                words[w] = replacements[words[w]]
    lines[l] = " ".join(words)

# print(replacements)
# print(lines)



# finding function zones
functions = {}
n = 0

print("finding function zones")
while n < len(lines):

    words = lines[n].split()
    if words[0] == "[":
        funcName = lines[n+1]
        funcStart = n
        while lines[n] != "]":
            n += 1
        funcEnd = n
        functions[funcName] = {"start": funcStart, "end": funcEnd}
    n += 1

# compile functions


print("compiling functions")

compiledFunctions = {}

for func in functions:
    print(f"compiling {func}")
    name = func
    start = functions[func]["start"]
    end = functions[func]["end"]

    # define function variables
    variables[f"{name}_returnnum"] = 0
    for l in range(start+2, end):
        words = lines[l].split()
        if words[0][0]=="^" and len(words) == 1:
            variables[f"{name}_{words[0][1:]}"] = 0
    # compile function
    compiled = []
    compiled.append(f"funcbegin_{name}:")
    ifNum = 0
    l = start+2
    while l < end:
    # for l in range(start+2, end):
        words = lines[l].split()
        if words[0][0]=="^" and len(words) == 1:
            l += 1
            continue
        # compiling arithmetic and assignments
        if len(words) >= 3 and len(words)%2 == 1:
            if words[1] == "=>":
                if words[0][0] == "^":
                    if words[0] != "^ret":
                        compiled.append(f"lda {name}_{words[0][1:]}")
                    else:
                        compiled.append(f"lda ^ret")

                elif words[0][0] == "@":
                    compiled.append(f"lda {words[0][1:]}")
                compiled.append(f"sta &{words[2]}")
            else:
                if words[2][0] == "^":
                    if words[2] != "^ret":
                        compiled.append(f"lda {name}_{words[2][1:]}")
                    else:
                        compiled.append(f"lda ^ret")

                elif words[2][0] == "@":
                    compiled.append(f"lda {words[2][1:]}")
                else:
                    if not words[2] in numConsts:
                        numConsts.append(words[2])
                    compiled.append(f"lda {numToText(words[2])}")

                n = 3
                # arithmetic
                while n < len(words)-1:

                    if words[n] == "+":
                        if words[n+1][0] == "^":
                            compiled.append(f"add {name}_{words[n+1][1:]}")
                        elif words[n+1][0] == "@":
                            compiled.append(f"add {words[n+1][1:]}")
                        else:
                            if not words[n+1] in numConsts:
                                numConsts.append(words[n+1])
                            compiled.append(f"add {numToText(words[n+1])}")
                    elif words[n] == "-":
                        if words[n+1][0] == "^":
                            compiled.append(f"sub {name}_{words[n+1][1:]}")
                        elif words[n+1][0] == "@":
                            compiled.append(f"sub {words[n+1][1:]}")
                        else:
                            if not words[n + 1] in numConsts:
                                numConsts.append(words[n + 1])
                            compiled.append(f"sub {numToText(words[n + 1])}")
                    else:
                        raise Exception(lines[l])
                    n += 2
                    # print(words)

                if words[0][0] == "^":
                    if words[0] != "^ret":
                        compiled.append(f"sta {name}_{words[0][1:]}")
                    else:
                        compiled.append(f"sta ^ret")
                elif words[0][0] == "@":
                    compiled.append(f"sta {words[0][1:]}")
        # labels
        elif words[0] == "~":
            compiled.append(f"{name}_{words[1]}:")
            # compiled.append(f"sta &ff0")
        # goto
        elif words[0] == "goto":
            compiled.append(f"jmp {name}_{words[1]}:")
        # if statements
        elif words[0] == "if":
            ifRet, skipDist = functionCompileIf(name, ifNum, l)
            l += skipDist
            compiled += ifRet
        # function calls
        elif words[0][0] == ":":
            compiled.append(f"SPAWNFUNCTION {words[0][1:]}")



        l += 1


    compiledFunctions[name] = compiled


print("compiling main code")

l = 0
compiled = []
ifNum = 0
while l < len(lines):
    line = lines[l]
    words = line.split()
    doCont = False
    for i in functions:
        if l == functions[i]["start"]:
            l = functions[i]["end"]
            doCont = True
            break
    if doCont:
        l += 1
        continue

    if words[0][0] == "%" and len(words) == 1:
        l += 1
        continue
    # if words[0] == "BREAK" and len(words) == 1:
    #     compiled.append(f"BREAK")
    #     l += 1
    #     continue
    # compiling arithmetic and assignments
    if len(words) >= 3 and len(words) % 2 == 1:
        if words[1] == "=>":
            compiled.append(f"lda {words[0][1:]}")
            compiled.append(f"sta &{words[2]}")
        else:
            if words[2] != "^ret":
                if words[2][0] != "@":
                    if not words[2] in numConsts:
                        numConsts.append(words[2])
                    compiled.append(f"lda {numToText(words[2])}")
                else:
                    compiled.append(f"lda {words[2][1:]}")
            else:
                compiled.append(f"lda ^ret")

            n = 3
            # arithmetic
            while n < len(words) - 1:
                if words[n] == "+":
                    if words[n + 1][0] != "@":
                        if not words[n + 1] in numConsts:
                            numConsts.append(words[n + 1])
                        compiled.append(f"add {numToText(words[n+1])}")
                    else:
                        compiled.append(f"add {words[n + 1][1:]}")
                elif words[n] == "-":
                    if words[n + 1][0] != "@":
                        if not words[n + 1] in numConsts:
                            numConsts.append(words[n + 1])
                        compiled.append(f"sub {numToText(words[n+1])}")
                    else:
                        compiled.append(f"sub {words[n + 1][1:]}")

                else:
                    raise Exception(lines[l])
                n += 2
            compiled.append(f"sta {words[0][1:]}")
    # labels
    elif words[0] == "~":
        compiled.append(f"{words[1]}:")
        # compiled.append(f"sta &ff0")
    # goto
    elif words[0] == "goto":
        compiled.append(f"jmp {words[1]}:")
    # if statements
    elif words[0] == "if":
        ifRet, skipDist = mainCompileIf(ifNum, l)
        l += skipDist
        compiled += ifRet
    # function calls
    elif words[0][0] == ":":
        compiled.append(f"SPAWNFUNCTION {words[0][1:]}")

    l += 1

compiled.append("stp")
print("spawning functions")
# for i in compiledFunctions:
    # print(i)
    # print(compiledFunctions[i])

def spawnFunction(name):
    func = compiledFunctions[name]
    # spawn = [i.replace("CALLNUM","_") for i in func]
    # spawn
    spawn = func
    return spawn


# look for function calls inside functions
# then look for function calls in main

spawnNums = {}
spawnParents = {}

for func in compiledFunctions:
    lines = compiledFunctions[func]
    for line in lines:
        words = line.split()
        if len(words) == 0:
            continue
        if words[0] == "SPAWNFUNCTION":
            if words[1] in spawnNums:
                spawnNums[words[1]] += 1
            else:
                spawnNums[words[1]] = 1

            try:
                spawnParents[words[1]][func] += 1
            except:
                spawnParents[words[1]] = {func: 1}
# print(spawnParents)


for line in compiled:
    words = line.split()
    if len(words) == 0:
        continue
    if words[0] == "SPAWNFUNCTION":
        if words[1] in spawnNums:
            spawnNums[words[1]] += 1
        else:
            spawnNums[words[1]] = 1



"""
if 1 spawn:

@name_returnnum = 0
:name

jmp name_return1location:

if 2 spawns:


lda name_returnnum
jne ZERO name_nextret1:
jmp name_return1location:
name_nextret1: jmp name_return2location:

if 3 spawns:

lda name_returnnum
jne ZERO name_nextret1:
jmp name_return1location:
name_nextret1: sub ONE
jne ZERO name_nextret2:
jmp name_return2location:
nextret2: jmp name_return3location:



"""

# spawnNums["random"] = 3

# print(spawnNums)

for func in spawnNums:
    num = spawnNums[func]
    if num == 1:
        # variables[f"{func}_return1location"] = 0
        compiledFunctions[func].append(f"jmp {func}_return0location:")
    else:
        variables[f"{func}_returnnum"] = 0
        compiledFunctions[func] += [f"lda {func}_returnnum",
                                    f"jne {func}_nextret0:",
                                    f"jmp {func}_return0location:"]
        for i in range(spawnNums[func]-1):
            compiledFunctions[func] += [f"{func}_nextret{i}:",
                                        f"sub ONE",
                                        f"jne {func}_nextret{i+1}:",
                                        f"jmp {func}_return{i+1}location:"]
        # compiledFunctions[func].append(f"nextret{num-1}: jmp {func}_return{num}location:")
        compiledFunctions[func].pop(-2)
        compiledFunctions[func].pop(-2)
        # compiledFunctions[func][-2] = compiledFunctions[func][-2].replace("sub ONE", f"jmp {func}_return{num-1}location:")
        # compiledFunctions[func].pop(-1)


# for func in compiledFunctions:
#     print(func)
#     for line in compiledFunctions[func]:
#         print(line)
#     print()


spawnCounts = {}
for i in spawnNums:
    spawnCounts[i] = 0





for func in compiledFunctions:
    while True:
        spawned = False
        for l in range(len(compiledFunctions[func])):
            line = compiledFunctions[func][l]
            words = line.split()
            if words[0] == "SPAWNFUNCTION":
                compiledFunctions[func][l:l+1] = [f"lda {numToText(spawnCounts[words[1]])}",
                                                  f"sta {words[1]}_returnnum",
                                                  f"jmp funcbegin_{words[1]}:",
                                                  f"{words[1]}_return{spawnCounts[words[1]]}location:"]
                if not spawnCounts[words[1]] in numConsts:
                    numConsts.append(spawnCounts[words[1]])
                spawnCounts[words[1]] += 1

                spawned = True

                break
        if not spawned:
            break

# spawnNum = 1
a = 1
while True:
    spawned = False
    for l in range(len(compiled)):
        line = compiled[l]
        words = line.split()
        if words[0] == "SPAWNFUNCTION":
            compiled[l:l + 1] = [f"lda {numToText(spawnCounts[words[1]])}",
                                 f"sta {words[1]}_returnnum",
                                 f"jmp funcbegin_{words[1]}:",
                                 f"{words[1]}_return{spawnCounts[words[1]]}location:"]
            if not spawnCounts[words[1]] in numConsts:
                numConsts.append(spawnCounts[words[1]])
            spawnCounts[words[1]] += 1

            spawned = True
            break
    if not spawned:
        break


# print(spawnNums)
for f in spawnNums:
    if f in spawnParents:
        for parent in spawnParents[f]:
            if spawnParents[f][parent] > 0 and not parent in spawnNums:
                spawnNums[f] -= spawnParents[f][parent]
# print(spawnNums)

while True:
    deleted = False
    for f in spawnNums:
        if spawnNums[f] == 0:
            del spawnNums[f]
            deleted = True
            break
    if not deleted:
        break

for f in spawnNums:
    # print("SPAWNIN FRFR")
    # print(f)
    compiled += compiledFunctions[f]
# print(compiled)



print("writing variables")


def decToHex(num, pad=4):
    return hex(int(num))[2:].rjust(pad, "0")

for v in variables:
    compiled.append(f"{v} defw &{decToHex(variables[v])}")
for n in numConsts:
    compiled.append(f"{numToText(n)} defw &{decToHex(n)}")

print("mushing labels")

while True:
    mushed = False
    for l in range(len(compiled)):
        line = compiled[l]
        words = line.split()
        if words[0][-1] == ":" and len(words) == 1:
            nextLine = compiled[l+1].split()
            if len(nextLine) == 1 and nextLine[0][-1] == ":":
                compiled[l] = compiled[l] + " sta &fef"
            else:
                compiled[l:l+2] = [" ".join(compiled[l:l+2])]
            mushed = True
            break


    if not mushed:
        break


print("===== done! =====\n\n")


for i in compiled:
    print(i)

with open("compile_out.s","w") as f:
    f.write("\n".join(compiled))









