# mew-not
A programming language and compiler for the Mu0 architecture, as well as an emulator, with memory mapped peripherals.
## Why?
I was tasked with making an arbitrary MU0 program, so I almost immediately went on a side quest to create a compiler and programming language, for fun? For sense of accomplishment? Something like that

The motivation behind the emulator was so I could work at home instead of at the labs, where the actual boards running MU0 were.



## Emulator usage (mog.py)
<img width="419" height="315" alt="image" src="https://github.com/user-attachments/assets/e4afb231-cfa3-4ee9-8652-72795ab1a8fe" />

<img width="596" height="475" alt="image" src="https://github.com/user-attachments/assets/e96758fb-a513-4880-b188-cbb604371624" />

Modify line 1039 to the desired program file to run:
```python
with open("black_jack.s","r") as f:
```
Then run (`mog.py`).
Requires pygame, numpy and sounddevice.

## Programming Language Syntax
Global variables:
```
%variableName
@variableName = 10
```
Variables have to be initialised with `%` before being accessed/used with `@`.
Variables can be initialised with a starting value, or left empty for 0:
```
%var1
@var2 20
```
Definition value shorthands:
```
;val 20
%var1 ;val
%var2 ;val

(same as)

@var1 20
@var2 20

```

Add/subtract:
```
@b = @a - 10 + @c
```
Conditional statements (>, >=, <, <=, !=, ==):
```
if @a > 20
...
endif

if @c != @d
...
endif
```
Loops and goto labels:
```
@loopcount = 3
~ loopstart
if @loopcount > 0
@loopcount = @loopcount - 1
... (loop body)

goto ~loopstart
```
Function definitions:

Variables used inside functions (attributes) must be defined before assigned a value. Moreover, `^` is used as a prefix instead of `@` when accessing attributes of the current function.
```
[
funcName

^funcVariable
^funcVariable = 2
...
]
```
Calling functions:
```
:funcName
```
Functions can be called within other functions. However, recursion is not supported.

Accessing attributes from outside the function:
```
@funcName_funcVariable = 69
```
Note that functions can have defined attributes, but no initialised value. This can be used to pass values in and out of the function:
```
[
multiply
^v1
^v2
^v2_copy
^out
^out = 0
^v2_copy = ^v2
~ start
if ^v2_copy > 0
^out = ^out + ^v1
^v2_copy = ^v2_copy - 1
goto start
endif

]

@multiply_v1 = 4
@multiply_v2 = 5
:multiply
@result = @multiply_out
```

2 different functions can have the same goto label and they will not interfere with each other.

Defining/writing/reading memory locations:
```
?digit0 ff5
@valueToWrite => ?digit0

?keypad ff2
@keyValues <= ?keypad

```

## Compiler usage (compilev2.2.py)
Modify line 566 to the source code file:
```python
with open("code3.txt", "r") as f:
```
Then run `compilev2.2.py2`. Outputs to `compile_out.s` by default.

It is recommended to run `refactor.py`. It reads `compile_out.s` by default and outputs to `refactored.s`.

`refactor.py` optimises the machine code to remove redundant instructions. This was necessary for the example `black_jack.s` (`code3.txt`) as the produced machine code exceeds 4096 lines, which is the limit for MU0.



## MU0 info
Features a 16-bit architecture with a 12-bit address space, allowing it to directly address up to 4,096 (4K) words of 16-bit memory (8 KB total).
### Instruction set
| Opcode	| Usage	| Description
|---|---|---|
| 0000	| LDA x	| Load the value at address x into accumulator |
| 0001	| STA x	| Store the accumulator value to address x |
| 0010	| ADD x	| Add value of address x to accumulator |
| 0011	| SUB x	| Sub value of address x from accumulator |
| 0100	| JMP X	| Jump to address X |
| 0101	| JGE X	| Jump to X if accumulator value >= 0 |
| 0110	| JNE X	| Jump to X if accumulator value != 0 |
| 0111	| STP	| Stops execution |

Labels usage:
`<label> <instruction or data>`
So, for example
```
       JMP alabel:
...
alabel: ADD &123
```

(Note that in the original MU0, the `:` after label names are not required, but they are required for the emulator to function correctly)

Defining data in memory:
`<label> DEFW <initial_value>`
Example:
```
LDA data
...
data DEFW &1234
```

## Memory mapped peripherals
|Feature | Address |
|-|-|
| Buzzer | &FFD |
| Digit 5 | &FFA |
| Digit 4 | &FF9 |
| Digit 3 | &FF8 |
| Digit 2 | &FF7 |
| Digit 1 | &FF6 |
| Digit 0 | &FF5 |
| Buzzer busy | &FF3 |
| Keypad | &FF2 |
| Buttons A to H | &FF1 |

The number displays are 15-segmented: 

<img width="162" height="199" alt="image" src="https://github.com/user-attachments/assets/e0bfb9c6-1988-4baf-a258-170d6a647620" />

| Bit Number | Segment |
|:----------:|:-------:|
| 0 | a |
| 1 | b |
| 2 | c |
| 3 | d |
| 4 | e |
| 5 | f |
| 6 | g1 |
| 7 | g2 |
| 8 | h |
| 9 | i |
| 10 | j |
| 11 | k |
| 12 | l |
| 13 | m |
| 14 | dp |


To enable/disable a segment, set its corresponding bit value to 1/0.

Keypad mappings:
| Keypad | Bit | Keypad | Bit |
|:------:|:---:|:------:|:---:|
| 0 | 0 | 8 | 8 |
| 1 | 1 | 9 | 9 |
| 2 | 2 | A | 10 |
| 3 | 3 | B | 11 |
| 4 | 4 | C | 12 |
| 5 | 5 | D | 13 |
| 6 | 6 | E | 14 |
| 7 | 7 | F | 15 |


when reading from address &FF2, a bit value being 1 corresponds to its button being pressed.

A - H buttons:
| Bit | Button |
|:---:|:------:|
| 0 | A |
| 1 | B |
| 2 | C |
| 3 | D |
| 4 | E |
| 5 | F |
| 6 | G |
| 7 | H |
| 8–15 | Not used |


when reading from address &FF1, a bit value being 1 corresponds to its button being pressed.

Buzzer:
| Bit Number | Signal | Function |
|:----------:|:------:|----------|
| 15 | Mode | Controls the operation of the buzzer.<br>**Mode = 1:** Programmable mode. Configures the buzzer using the Note, Octave and Duration values.<br>**Mode = 0:** Direct control mode. The buzzer is controlled directly using bit 0 of the Buzzer input. |
| 14:12 | Not used | Reserved bits. Not used. |
| 11:8 | Duration | A value from 0 to 15 that determines the duration of the note in 1/10th of a second intervals. Programmable mode only. |
| 7:4 | Octave | A value from 4 to 8 representing the octave. Higher values produce higher pitches. Increasing the octave by 1 doubles the note frequency. Values outside the range 4–8 default to 8. Programmable mode only. |
| 3:0 | Note | A value from 0 to 11 representing the 12 semitones in an octave. See Figure 6 for the corresponding note. Values outside this range default to 0 (Note C). Programmable mode only. |

| Code | Note |
|:----:|:----:|
| 0 | C |
| 1 | C# |
| 2 | D |
| 3 | D# |
| 4 | E |
| 5 | F |
| 6 | F# |
| 7 | G |
| 8 | G# |
| 9 | A |
| 10 | A# |
| 11 | B |



