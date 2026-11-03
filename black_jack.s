lda onezerozerozerozero
sta random_max
lda zero
sta time1sec_returnnum
jmp funcbegin_time1sec:
time1sec_return0location: lda zero
sta wait_half_init_returnnum
jmp funcbegin_wait_half_init:
wait_half_init_return0location: lda randseed1
add time1sec_count
sta randseed1
lda zero
sta print_welcome_returnnum
jmp funcbegin_print_welcome:
print_welcome_return0location: sta &fef
wait_for_start: lda two
sta get_keypad_returnnum
jmp funcbegin_get_keypad:
get_keypad_return2location: lda get_keypad_0
sub one
jne main_endif_0:
jmp starting:
main_endif_0: lda wait_start_count
add one
sta wait_start_count
jmp wait_for_start:
starting: lda randseed2
add wait_start_count
sta randseed2
lda one
sta print_c_for_controls_returnnum
jmp funcbegin_print_c_for_controls:
print_c_for_controls_return1location: sta &fef
wait_start_loop: lda five
sta wait_start_loop_pause
lda zero
sta write_money_text_returnnum
jmp funcbegin_write_money_text:
write_money_text_return0location: sta &fef
wait_start_loop_1: lda seven
sta wait_half_returnnum
jmp funcbegin_wait_half:
wait_half_return7location: lda three
sta get_keypad_returnnum
jmp funcbegin_get_keypad:
get_keypad_return3location: lda get_keypad_c
sub one
jne main_endif_1:
lda zero
sta print_controls_returnnum
jmp funcbegin_print_controls:
print_controls_return0location: sta &fef
main_endif_1: lda get_keypad_b
sub one
jne main_endif_2:
lda zero
sta place_bet_returnnum
jmp funcbegin_place_bet:
place_bet_return0location: lda zero
sta begin_round_returnnum
jmp funcbegin_begin_round:
begin_round_return0location: sta &fef
main_endif_2: lda wait_start_loop_pause
sub one
sta wait_start_loop_pause
lda zero
sub wait_start_loop_pause
jge main_endif_3:
jmp wait_start_loop_1:
main_endif_3: lda five
sta wait_start_loop_pause
lda zero
sta write_money_value_returnnum
jmp funcbegin_write_money_value:
write_money_value_return0location: sta &fef
wait_start_loop_2: lda eight
sta wait_half_returnnum
jmp funcbegin_wait_half:
wait_half_return8location: lda four
sta get_keypad_returnnum
jmp funcbegin_get_keypad:
get_keypad_return4location: lda get_keypad_c
sub one
jne main_endif_4:
lda one
sta print_controls_returnnum
jmp funcbegin_print_controls:
print_controls_return1location: sta &fef
main_endif_4: lda get_keypad_b
sub one
jne main_endif_5:
lda one
sta place_bet_returnnum
jmp funcbegin_place_bet:
place_bet_return1location: lda one
sta begin_round_returnnum
jmp funcbegin_begin_round:
begin_round_return1location: sta &fef
main_endif_5: lda wait_start_loop_pause
sub one
sta wait_start_loop_pause
lda zero
sub wait_start_loop_pause
jge main_endif_6:
jmp wait_start_loop_2:
main_endif_6: jmp wait_start_loop:
mainloop: lda one
sta random_returnnum
jmp funcbegin_random:
random_return1location: lda random_out
sta display_num_num
lda three
sta display_num_returnnum
jmp funcbegin_display_num:
display_num_return3location: lda threefive
sta wait_returnnum
jmp funcbegin_wait:
wait_return35location: jmp mainloop:
endprogram: stp
funcbegin_print_c_for_controls: lda zero
sta print_c_for_controls_char0
lda zero
sta print_c_for_controls_char1
lda zero
sta print_c_for_controls_char2
lda zero
sta print_c_for_controls_char3
lda zero
sta print_c_for_controls_char4
lda zero
sta print_c_for_controls_char5
lda zero
sta print_c_for_controls_progress
lda print_c_for_controls_length
add six
sta print_c_for_controls_maxProgress
print_c_for_controls_train: lda print_c_for_controls_char4
sta print_c_for_controls_char5
lda print_c_for_controls_char3
sta print_c_for_controls_char4
lda print_c_for_controls_char2
sta print_c_for_controls_char3
lda print_c_for_controls_char1
sta print_c_for_controls_char2
lda print_c_for_controls_char0
sta print_c_for_controls_char1
lda print_c_for_controls_progress
jne print_c_for_controls_endif_0:
lda print_c_for_controls_c_0
sta print_c_for_controls_char0
jmp print_c_for_controls_train_end:
print_c_for_controls_endif_0: lda print_c_for_controls_progress
sub one
jne print_c_for_controls_endif_1:
lda print_c_for_controls_c_1
sta print_c_for_controls_char0
jmp print_c_for_controls_train_end:
print_c_for_controls_endif_1: lda print_c_for_controls_progress
sub two
jne print_c_for_controls_endif_2:
lda print_c_for_controls_c_2
sta print_c_for_controls_char0
jmp print_c_for_controls_train_end:
print_c_for_controls_endif_2: lda print_c_for_controls_progress
sub three
jne print_c_for_controls_endif_3:
lda print_c_for_controls_c_3
sta print_c_for_controls_char0
jmp print_c_for_controls_train_end:
print_c_for_controls_endif_3: lda print_c_for_controls_progress
sub four
jne print_c_for_controls_endif_4:
lda print_c_for_controls_c_4
sta print_c_for_controls_char0
jmp print_c_for_controls_train_end:
print_c_for_controls_endif_4: lda print_c_for_controls_progress
sub five
jne print_c_for_controls_endif_5:
lda print_c_for_controls_c_5
sta print_c_for_controls_char0
jmp print_c_for_controls_train_end:
print_c_for_controls_endif_5: lda print_c_for_controls_progress
sub six
jne print_c_for_controls_endif_6:
lda print_c_for_controls_c_6
sta print_c_for_controls_char0
jmp print_c_for_controls_train_end:
print_c_for_controls_endif_6: lda print_c_for_controls_progress
sub seven
jne print_c_for_controls_endif_7:
lda print_c_for_controls_c_7
sta print_c_for_controls_char0
jmp print_c_for_controls_train_end:
print_c_for_controls_endif_7: lda print_c_for_controls_progress
sub eight
jne print_c_for_controls_endif_8:
lda print_c_for_controls_c_8
sta print_c_for_controls_char0
jmp print_c_for_controls_train_end:
print_c_for_controls_endif_8: lda print_c_for_controls_progress
sub nine
jne print_c_for_controls_endif_9:
lda print_c_for_controls_c_9
sta print_c_for_controls_char0
jmp print_c_for_controls_train_end:
print_c_for_controls_endif_9: lda print_c_for_controls_progress
sub onezero
jne print_c_for_controls_endif_10:
lda print_c_for_controls_c_10
sta print_c_for_controls_char0
jmp print_c_for_controls_train_end:
print_c_for_controls_endif_10: lda print_c_for_controls_progress
sub oneone
jne print_c_for_controls_endif_11:
lda print_c_for_controls_c_11
sta print_c_for_controls_char0
jmp print_c_for_controls_train_end:
print_c_for_controls_endif_11: lda print_c_for_controls_progress
sub onetwo
jne print_c_for_controls_endif_12:
lda print_c_for_controls_c_12
sta print_c_for_controls_char0
jmp print_c_for_controls_train_end:
print_c_for_controls_endif_12: lda print_c_for_controls_progress
sub onethree
jne print_c_for_controls_endif_13:
lda print_c_for_controls_c_13
sta print_c_for_controls_char0
jmp print_c_for_controls_train_end:
print_c_for_controls_endif_13: lda print_c_for_controls_progress
sub onefour
jne print_c_for_controls_endif_14:
lda print_c_for_controls_c_14
sta print_c_for_controls_char0
jmp print_c_for_controls_train_end:
print_c_for_controls_endif_14: lda print_c_for_controls_progress
sub onefive
jne print_c_for_controls_endif_15:
lda print_c_for_controls_c_15
sta print_c_for_controls_char0
jmp print_c_for_controls_train_end:
print_c_for_controls_endif_15: lda print_c_for_controls_progress
sub onesix
jne print_c_for_controls_endif_16:
lda print_c_for_controls_c_16
sta print_c_for_controls_char0
jmp print_c_for_controls_train_end:
print_c_for_controls_endif_16: lda print_c_for_controls_progress
sub oneseven
jne print_c_for_controls_endif_17:
lda print_c_for_controls_c_17
sta print_c_for_controls_char0
jmp print_c_for_controls_train_end:
print_c_for_controls_endif_17: lda print_c_for_controls_progress
sub oneeight
jne print_c_for_controls_endif_18:
lda print_c_for_controls_c_18
sta print_c_for_controls_char0
jmp print_c_for_controls_train_end:
print_c_for_controls_endif_18: lda print_c_for_controls_progress
sub onenine
jne print_c_for_controls_endif_19:
lda print_c_for_controls_c_19
sta print_c_for_controls_char0
jmp print_c_for_controls_train_end:
print_c_for_controls_endif_19: lda print_c_for_controls_progress
sub twozero
jne print_c_for_controls_endif_20:
lda print_c_for_controls_c_20
sta print_c_for_controls_char0
jmp print_c_for_controls_train_end:
print_c_for_controls_endif_20: lda zero
sta print_c_for_controls_char0
print_c_for_controls_train_end: lda print_c_for_controls_char5
sta &ffa
lda print_c_for_controls_char4
sta &ff9
lda print_c_for_controls_char3
sta &ff8
lda print_c_for_controls_char2
sta &ff7
lda print_c_for_controls_char1
sta &ff6
lda print_c_for_controls_char0
sta &ff5
lda four
sta wait_half_returnnum
jmp funcbegin_wait_half:
wait_half_return4location: lda print_c_for_controls_progress
add one
sta print_c_for_controls_progress
sub print_c_for_controls_maxProgress
jge print_c_for_controls_if_21_check:
jmp print_c_for_controls_if_21_start:
print_c_for_controls_if_21_check: lda print_c_for_controls_maxProgress
sub print_c_for_controls_progress
jge print_c_for_controls_endif_21:
print_c_for_controls_if_21_start: jmp print_c_for_controls_train:
print_c_for_controls_endif_21: lda print_c_for_controls_returnnum
jne print_c_for_controls_nextret0:
jmp print_c_for_controls_return0location:
print_c_for_controls_nextret0: jmp print_c_for_controls_return1location:
funcbegin_print_b_control: lda zero
sta print_b_control_char0
lda zero
sta print_b_control_char1
lda zero
sta print_b_control_char2
lda zero
sta print_b_control_char3
lda zero
sta print_b_control_char4
lda zero
sta print_b_control_char5
lda zero
sta print_b_control_progress
lda print_b_control_length
add six
sta print_b_control_maxProgress
print_b_control_train: lda print_b_control_char4
sta print_b_control_char5
lda print_b_control_char3
sta print_b_control_char4
lda print_b_control_char2
sta print_b_control_char3
lda print_b_control_char1
sta print_b_control_char2
lda print_b_control_char0
sta print_b_control_char1
lda print_b_control_progress
jne print_b_control_endif_0:
lda print_b_control_c_0
sta print_b_control_char0
jmp print_b_control_train_end:
print_b_control_endif_0: lda print_b_control_progress
sub one
jne print_b_control_endif_1:
lda print_b_control_c_1
sta print_b_control_char0
jmp print_b_control_train_end:
print_b_control_endif_1: lda print_b_control_progress
sub two
jne print_b_control_endif_2:
lda print_b_control_c_2
sta print_b_control_char0
jmp print_b_control_train_end:
print_b_control_endif_2: lda print_b_control_progress
sub three
jne print_b_control_endif_3:
lda print_b_control_c_3
sta print_b_control_char0
jmp print_b_control_train_end:
print_b_control_endif_3: lda print_b_control_progress
sub four
jne print_b_control_endif_4:
lda print_b_control_c_4
sta print_b_control_char0
jmp print_b_control_train_end:
print_b_control_endif_4: lda print_b_control_progress
sub five
jne print_b_control_endif_5:
lda print_b_control_c_5
sta print_b_control_char0
jmp print_b_control_train_end:
print_b_control_endif_5: lda print_b_control_progress
sub six
jne print_b_control_endif_6:
lda print_b_control_c_6
sta print_b_control_char0
jmp print_b_control_train_end:
print_b_control_endif_6: lda print_b_control_progress
sub seven
jne print_b_control_endif_7:
lda print_b_control_c_7
sta print_b_control_char0
jmp print_b_control_train_end:
print_b_control_endif_7: lda print_b_control_progress
sub eight
jne print_b_control_endif_8:
lda print_b_control_c_8
sta print_b_control_char0
jmp print_b_control_train_end:
print_b_control_endif_8: lda print_b_control_progress
sub nine
jne print_b_control_endif_9:
lda print_b_control_c_9
sta print_b_control_char0
jmp print_b_control_train_end:
print_b_control_endif_9: lda print_b_control_progress
sub onezero
jne print_b_control_endif_10:
lda print_b_control_c_10
sta print_b_control_char0
jmp print_b_control_train_end:
print_b_control_endif_10: lda print_b_control_progress
sub oneone
jne print_b_control_endif_11:
lda print_b_control_c_11
sta print_b_control_char0
jmp print_b_control_train_end:
print_b_control_endif_11: lda print_b_control_progress
sub onetwo
jne print_b_control_endif_12:
lda print_b_control_c_12
sta print_b_control_char0
jmp print_b_control_train_end:
print_b_control_endif_12: lda print_b_control_progress
sub onethree
jne print_b_control_endif_13:
lda print_b_control_c_13
sta print_b_control_char0
jmp print_b_control_train_end:
print_b_control_endif_13: lda zero
sta print_b_control_char0
print_b_control_train_end: lda print_b_control_char5
sta &ffa
lda print_b_control_char4
sta &ff9
lda print_b_control_char3
sta &ff8
lda print_b_control_char2
sta &ff7
lda print_b_control_char1
sta &ff6
lda print_b_control_char0
sta &ff5
lda three
sta wait_half_returnnum
jmp funcbegin_wait_half:
wait_half_return3location: lda print_b_control_progress
add one
sta print_b_control_progress
sub print_b_control_maxProgress
jge print_b_control_if_14_check:
jmp print_b_control_if_14_start:
print_b_control_if_14_check: lda print_b_control_maxProgress
sub print_b_control_progress
jge print_b_control_endif_14:
print_b_control_if_14_start: jmp print_b_control_train:
print_b_control_endif_14: jmp print_b_control_return0location:
funcbegin_print_a_control: lda zero
sta print_a_control_char0
lda zero
sta print_a_control_char1
lda zero
sta print_a_control_char2
lda zero
sta print_a_control_char3
lda zero
sta print_a_control_char4
lda zero
sta print_a_control_char5
lda zero
sta print_a_control_progress
lda print_a_control_length
add six
sta print_a_control_maxProgress
print_a_control_train: lda print_a_control_char4
sta print_a_control_char5
lda print_a_control_char3
sta print_a_control_char4
lda print_a_control_char2
sta print_a_control_char3
lda print_a_control_char1
sta print_a_control_char2
lda print_a_control_char0
sta print_a_control_char1
lda print_a_control_progress
jne print_a_control_endif_0:
lda print_a_control_c_0
sta print_a_control_char0
jmp print_a_control_train_end:
print_a_control_endif_0: lda print_a_control_progress
sub one
jne print_a_control_endif_1:
lda print_a_control_c_1
sta print_a_control_char0
jmp print_a_control_train_end:
print_a_control_endif_1: lda print_a_control_progress
sub two
jne print_a_control_endif_2:
lda print_a_control_c_2
sta print_a_control_char0
jmp print_a_control_train_end:
print_a_control_endif_2: lda print_a_control_progress
sub three
jne print_a_control_endif_3:
lda print_a_control_c_3
sta print_a_control_char0
jmp print_a_control_train_end:
print_a_control_endif_3: lda print_a_control_progress
sub four
jne print_a_control_endif_4:
lda print_a_control_c_4
sta print_a_control_char0
jmp print_a_control_train_end:
print_a_control_endif_4: lda print_a_control_progress
sub five
jne print_a_control_endif_5:
lda print_a_control_c_5
sta print_a_control_char0
jmp print_a_control_train_end:
print_a_control_endif_5: lda print_a_control_progress
sub six
jne print_a_control_endif_6:
lda print_a_control_c_6
sta print_a_control_char0
jmp print_a_control_train_end:
print_a_control_endif_6: lda print_a_control_progress
sub seven
jne print_a_control_endif_7:
lda print_a_control_c_7
sta print_a_control_char0
jmp print_a_control_train_end:
print_a_control_endif_7: lda print_a_control_progress
sub eight
jne print_a_control_endif_8:
lda print_a_control_c_8
sta print_a_control_char0
jmp print_a_control_train_end:
print_a_control_endif_8: lda print_a_control_progress
sub nine
jne print_a_control_endif_9:
lda print_a_control_c_9
sta print_a_control_char0
jmp print_a_control_train_end:
print_a_control_endif_9: lda print_a_control_progress
sub onezero
jne print_a_control_endif_10:
lda print_a_control_c_10
sta print_a_control_char0
jmp print_a_control_train_end:
print_a_control_endif_10: lda print_a_control_progress
sub oneone
jne print_a_control_endif_11:
lda print_a_control_c_11
sta print_a_control_char0
jmp print_a_control_train_end:
print_a_control_endif_11: lda print_a_control_progress
sub onetwo
jne print_a_control_endif_12:
lda print_a_control_c_12
sta print_a_control_char0
jmp print_a_control_train_end:
print_a_control_endif_12: lda print_a_control_progress
sub onethree
jne print_a_control_endif_13:
lda print_a_control_c_13
sta print_a_control_char0
jmp print_a_control_train_end:
print_a_control_endif_13: lda print_a_control_progress
sub onefour
jne print_a_control_endif_14:
lda print_a_control_c_14
sta print_a_control_char0
jmp print_a_control_train_end:
print_a_control_endif_14: lda print_a_control_progress
sub onefive
jne print_a_control_endif_15:
lda print_a_control_c_15
sta print_a_control_char0
jmp print_a_control_train_end:
print_a_control_endif_15: lda zero
sta print_a_control_char0
print_a_control_train_end: lda print_a_control_char5
sta &ffa
lda print_a_control_char4
sta &ff9
lda print_a_control_char3
sta &ff8
lda print_a_control_char2
sta &ff7
lda print_a_control_char1
sta &ff6
lda print_a_control_char0
sta &ff5
lda zero
sta wait_half_returnnum
jmp funcbegin_wait_half:
wait_half_return0location: lda print_a_control_progress
add one
sta print_a_control_progress
sub print_a_control_maxProgress
jge print_a_control_if_16_check:
jmp print_a_control_if_16_start:
print_a_control_if_16_check: lda print_a_control_maxProgress
sub print_a_control_progress
jge print_a_control_endif_16:
print_a_control_if_16_start: jmp print_a_control_train:
print_a_control_endif_16: jmp print_a_control_return0location:
funcbegin_print_f_control: lda zero
sta print_f_control_char0
lda zero
sta print_f_control_char1
lda zero
sta print_f_control_char2
lda zero
sta print_f_control_char3
lda zero
sta print_f_control_char4
lda zero
sta print_f_control_char5
lda zero
sta print_f_control_progress
lda print_f_control_length
add six
sta print_f_control_maxProgress
print_f_control_train: lda print_f_control_char4
sta print_f_control_char5
lda print_f_control_char3
sta print_f_control_char4
lda print_f_control_char2
sta print_f_control_char3
lda print_f_control_char1
sta print_f_control_char2
lda print_f_control_char0
sta print_f_control_char1
lda print_f_control_progress
jne print_f_control_endif_0:
lda print_f_control_c_0
sta print_f_control_char0
jmp print_f_control_train_end:
print_f_control_endif_0: lda print_f_control_progress
sub one
jne print_f_control_endif_1:
lda print_f_control_c_1
sta print_f_control_char0
jmp print_f_control_train_end:
print_f_control_endif_1: lda print_f_control_progress
sub two
jne print_f_control_endif_2:
lda print_f_control_c_2
sta print_f_control_char0
jmp print_f_control_train_end:
print_f_control_endif_2: lda print_f_control_progress
sub three
jne print_f_control_endif_3:
lda print_f_control_c_3
sta print_f_control_char0
jmp print_f_control_train_end:
print_f_control_endif_3: lda print_f_control_progress
sub four
jne print_f_control_endif_4:
lda print_f_control_c_4
sta print_f_control_char0
jmp print_f_control_train_end:
print_f_control_endif_4: lda print_f_control_progress
sub five
jne print_f_control_endif_5:
lda print_f_control_c_5
sta print_f_control_char0
jmp print_f_control_train_end:
print_f_control_endif_5: lda print_f_control_progress
sub six
jne print_f_control_endif_6:
lda print_f_control_c_6
sta print_f_control_char0
jmp print_f_control_train_end:
print_f_control_endif_6: lda print_f_control_progress
sub seven
jne print_f_control_endif_7:
lda print_f_control_c_7
sta print_f_control_char0
jmp print_f_control_train_end:
print_f_control_endif_7: lda zero
sta print_f_control_char0
print_f_control_train_end: lda print_f_control_char5
sta &ffa
lda print_f_control_char4
sta &ff9
lda print_f_control_char3
sta &ff8
lda print_f_control_char2
sta &ff7
lda print_f_control_char1
sta &ff6
lda print_f_control_char0
sta &ff5
lda two
sta wait_half_returnnum
jmp funcbegin_wait_half:
wait_half_return2location: lda print_f_control_progress
add one
sta print_f_control_progress
sub print_f_control_maxProgress
jge print_f_control_if_8_check:
jmp print_f_control_if_8_start:
print_f_control_if_8_check: lda print_f_control_maxProgress
sub print_f_control_progress
jge print_f_control_endif_8:
print_f_control_if_8_start: jmp print_f_control_train:
print_f_control_endif_8: jmp print_f_control_return0location:
funcbegin_print_e_control: lda zero
sta print_e_control_char0
lda zero
sta print_e_control_char1
lda zero
sta print_e_control_char2
lda zero
sta print_e_control_char3
lda zero
sta print_e_control_char4
lda zero
sta print_e_control_char5
lda zero
sta print_e_control_progress
lda print_e_control_length
add six
sta print_e_control_maxProgress
print_e_control_train: lda print_e_control_char4
sta print_e_control_char5
lda print_e_control_char3
sta print_e_control_char4
lda print_e_control_char2
sta print_e_control_char3
lda print_e_control_char1
sta print_e_control_char2
lda print_e_control_char0
sta print_e_control_char1
lda print_e_control_progress
jne print_e_control_endif_0:
lda print_e_control_c_0
sta print_e_control_char0
jmp print_e_control_train_end:
print_e_control_endif_0: lda print_e_control_progress
sub one
jne print_e_control_endif_1:
lda print_e_control_c_1
sta print_e_control_char0
jmp print_e_control_train_end:
print_e_control_endif_1: lda print_e_control_progress
sub two
jne print_e_control_endif_2:
lda print_e_control_c_2
sta print_e_control_char0
jmp print_e_control_train_end:
print_e_control_endif_2: lda print_e_control_progress
sub three
jne print_e_control_endif_3:
lda print_e_control_c_3
sta print_e_control_char0
jmp print_e_control_train_end:
print_e_control_endif_3: lda print_e_control_progress
sub four
jne print_e_control_endif_4:
lda print_e_control_c_4
sta print_e_control_char0
jmp print_e_control_train_end:
print_e_control_endif_4: lda print_e_control_progress
sub five
jne print_e_control_endif_5:
lda print_e_control_c_5
sta print_e_control_char0
jmp print_e_control_train_end:
print_e_control_endif_5: lda print_e_control_progress
sub six
jne print_e_control_endif_6:
lda print_e_control_c_6
sta print_e_control_char0
jmp print_e_control_train_end:
print_e_control_endif_6: lda print_e_control_progress
sub seven
jne print_e_control_endif_7:
lda print_e_control_c_7
sta print_e_control_char0
jmp print_e_control_train_end:
print_e_control_endif_7: lda print_e_control_progress
sub eight
jne print_e_control_endif_8:
lda print_e_control_c_8
sta print_e_control_char0
jmp print_e_control_train_end:
print_e_control_endif_8: lda print_e_control_progress
sub nine
jne print_e_control_endif_9:
lda print_e_control_c_9
sta print_e_control_char0
jmp print_e_control_train_end:
print_e_control_endif_9: lda zero
sta print_e_control_char0
print_e_control_train_end: lda print_e_control_char5
sta &ffa
lda print_e_control_char4
sta &ff9
lda print_e_control_char3
sta &ff8
lda print_e_control_char2
sta &ff7
lda print_e_control_char1
sta &ff6
lda print_e_control_char0
sta &ff5
lda one
sta wait_half_returnnum
jmp funcbegin_wait_half:
wait_half_return1location: lda print_e_control_progress
add one
sta print_e_control_progress
sub print_e_control_maxProgress
jge print_e_control_if_10_check:
jmp print_e_control_if_10_start:
print_e_control_if_10_check: lda print_e_control_maxProgress
sub print_e_control_progress
jge print_e_control_endif_10:
print_e_control_if_10_start: jmp print_e_control_train:
print_e_control_endif_10: jmp print_e_control_return0location:
funcbegin_wait_half: lda wait_half_init_out_out_loop
sta wait_half_out_out_loop
lda wait_half_init_out_loop
sta wait_half_out_loop
lda wait_half_init_in_loop
sta wait_half_in_loop
lda threezerozerozerozero
sta wait_half_30k2
wait_half_looping_outer_outer: lda zero
sub wait_half_out_out_loop
jge wait_half_endif_0:
lda wait_half_out_out_loop
sub one
sta wait_half_out_out_loop
lda threezerozerozerozero
sta wait_half_30k2
wait_half_outoutloopout: lda zero
sub wait_half_30k2
jge wait_half_endif_1:
lda wait_half_30k2
sub one
sta wait_half_30k2
lda threezerozerozerozero
sta wait_half_30k
wait_half_outoutloopin: lda zero
sub wait_half_30k
jge wait_half_endif_2:
lda wait_half_30k
sub one
sta wait_half_30k
jmp wait_half_outoutloopin:
wait_half_endif_2: jmp wait_half_outoutloopout:
wait_half_endif_1: jmp wait_half_looping_outer_outer:
wait_half_endif_0: sta &fef
wait_half_looping_outer: lda zero
sub wait_half_out_loop
jge wait_half_endif_3:
lda wait_half_out_loop
sub one
sta wait_half_out_loop
lda threezerozerozerozero
sta wait_half_30k
wait_half_30k_loop: lda zero
sub wait_half_30k
jge wait_half_endif_4:
lda wait_half_30k
sub one
sta wait_half_30k
jmp wait_half_30k_loop:
wait_half_endif_4: jmp wait_half_looping_outer:
wait_half_endif_3: sta &fef
wait_half_looping: lda zero
sub wait_half_in_loop
jge wait_half_endif_5:
lda wait_half_in_loop
sub one
sta wait_half_in_loop
jmp wait_half_looping:
wait_half_endif_5: lda wait_half_returnnum
jne wait_half_nextret0:
jmp wait_half_return0location:
wait_half_nextret0: sub ONE
jne wait_half_nextret1:
jmp wait_half_return1location:
wait_half_nextret1: sub ONE
jne wait_half_nextret2:
jmp wait_half_return2location:
wait_half_nextret2: sub ONE
jne wait_half_nextret3:
jmp wait_half_return3location:
wait_half_nextret3: sub ONE
jne wait_half_nextret4:
jmp wait_half_return4location:
wait_half_nextret4: sub ONE
jne wait_half_nextret5:
jmp wait_half_return5location:
wait_half_nextret5: sub ONE
jne wait_half_nextret6:
jmp wait_half_return6location:
wait_half_nextret6: sub ONE
jne wait_half_nextret7:
jmp wait_half_return7location:
wait_half_nextret7: jmp wait_half_return8location:
funcbegin_display_num: lda display_num_num
sta display_num_copy
lda zero
sta display_num_10kprinted
lda zero
sta display_num_1kprinted
lda zero
sta display_num_hprinted
lda zero
sta display_num_10ks
lda zero
sta display_num_1ks
lda zero
sta display_num_hs
lda zero
sta display_num_ts
lda zero
sta &ffa
lda zero
sta &ff9
lda zero
sta &ff8
lda zero
sta &ff7
lda zero
sta &ff6
lda zero
sta &ff5
lda ninenineninenine
sub display_num_copy
jge display_num_endif_0:
display_num_10kloop: lda display_num_10ks
add one
sta display_num_10ks
lda display_num_copy
sub onezerozerozerozero
sta display_num_copy
lda onezerozerozerozero
sub display_num_copy
jge display_num_if_1_check:
jmp display_num_if_1_start:
display_num_if_1_check: jne display_num_endif_1:
display_num_if_1_start: jmp display_num_10kloop:
display_num_endif_1: lda display_num_10ks
sta digit_num
lda zero
sta digit_returnnum
jmp funcbegin_digit:
digit_return0location: lda digit_out
sta &ff9
sta digit_out
lda one
sta display_num_10kprinted
display_num_endif_0: lda display_num_10kprinted
sub one
jne display_num_endif_2:
lda zero_char
sta &ff8
sta zero_char
lda one
sta display_num_1kprinted
display_num_endif_2: lda nineninenine
sub display_num_copy
jge display_num_endif_3:
display_num_1kloop: lda display_num_1ks
add one
sta display_num_1ks
lda display_num_copy
sub onezerozerozero
sta display_num_copy
lda onezerozerozero
sub display_num_copy
jge display_num_if_4_check:
jmp display_num_if_4_start:
display_num_if_4_check: jne display_num_endif_4:
display_num_if_4_start: jmp display_num_1kloop:
display_num_endif_4: lda display_num_1ks
sta digit_num
lda one
sta digit_returnnum
jmp funcbegin_digit:
digit_return1location: lda digit_out
sta &ff8
sta digit_out
lda one
sta display_num_1kprinted
display_num_endif_3: lda display_num_1kprinted
sub one
jne display_num_endif_5:
lda zero_char
sta &ff7
sta zero_char
lda one
sta display_num_hprinted
display_num_endif_5: lda ninenine
sub display_num_copy
jge display_num_endif_6:
display_num_hsloop: lda display_num_hs
add one
sta display_num_hs
lda display_num_copy
sub onezerozero
sta display_num_copy
lda onezerozero
sub display_num_copy
jge display_num_if_7_check:
jmp display_num_if_7_start:
display_num_if_7_check: jne display_num_endif_7:
display_num_if_7_start: jmp display_num_hsloop:
display_num_endif_7: lda display_num_hs
sta digit_num
lda two
sta digit_returnnum
jmp funcbegin_digit:
digit_return2location: lda digit_out
sta &ff7
sta digit_out
lda one
sta display_num_hprinted
display_num_endif_6: lda display_num_hprinted
sub one
jne display_num_endif_8:
lda zero_char
sta &ff6
sta zero_char
display_num_endif_8: lda nine
sub display_num_copy
jge display_num_endif_9:
display_num_tsloop: lda display_num_ts
add one
sta display_num_ts
lda display_num_copy
sub onezero
sta display_num_copy
lda onezero
sub display_num_copy
jge display_num_if_10_check:
jmp display_num_if_10_start:
display_num_if_10_check: jne display_num_endif_10:
display_num_if_10_start: jmp display_num_tsloop:
display_num_endif_10: lda display_num_ts
sta digit_num
lda three
sta digit_returnnum
jmp funcbegin_digit:
digit_return3location: lda digit_out
sta &ff6
sta digit_out
display_num_endif_9: lda display_num_copy
sta digit_num
lda four
sta digit_returnnum
jmp funcbegin_digit:
digit_return4location: lda digit_out
sta &ff5
lda display_num_returnnum
jne display_num_nextret0:
jmp display_num_return0location:
display_num_nextret0: sub ONE
jne display_num_nextret1:
jmp display_num_return1location:
display_num_nextret1: sub ONE
jne display_num_nextret2:
jmp display_num_return2location:
display_num_nextret2: jmp display_num_return3location:
funcbegin_wait: lda time1sec_count3
sta wait_out_out_loop
lda time1sec_count2
sta wait_out_loop
lda time1sec_count
sta wait_in_loop
lda threezerozerozerozero
sta wait_30k2
wait_looping_outer_outer: lda zero
sub wait_out_out_loop
jge wait_endif_0:
lda wait_out_out_loop
sub one
sta wait_out_out_loop
lda threezerozerozerozero
sta wait_30k2
wait_outoutloopout: lda zero
sub wait_30k2
jge wait_endif_1:
lda wait_30k2
sub one
sta wait_30k2
lda threezerozerozerozero
sta wait_30k
wait_outoutloopin: lda zero
sub wait_30k
jge wait_endif_2:
lda wait_30k
sub one
sta wait_30k
jmp wait_outoutloopin:
wait_endif_2: jmp wait_outoutloopout:
wait_endif_1: jmp wait_looping_outer_outer:
wait_endif_0: sta &fef
wait_looping_outer: lda zero
sub wait_out_loop
jge wait_endif_3:
lda wait_out_loop
sub one
sta wait_out_loop
lda threezerozerozerozero
sta wait_30k
wait_30k_loop: lda zero
sub wait_30k
jge wait_endif_4:
lda wait_30k
sub one
sta wait_30k
jmp wait_30k_loop:
wait_endif_4: jmp wait_looping_outer:
wait_endif_3: sta &fef
wait_looping: lda zero
sub wait_in_loop
jge wait_endif_5:
lda wait_in_loop
sub one
sta wait_in_loop
jmp wait_looping:
wait_endif_5: lda wait_returnnum
jne wait_nextret0:
jmp wait_return0location:
wait_nextret0: sub ONE
jne wait_nextret1:
jmp wait_return1location:
wait_nextret1: sub ONE
jne wait_nextret2:
jmp wait_return2location:
wait_nextret2: sub ONE
jne wait_nextret3:
jmp wait_return3location:
wait_nextret3: sub ONE
jne wait_nextret4:
jmp wait_return4location:
wait_nextret4: sub ONE
jne wait_nextret5:
jmp wait_return5location:
wait_nextret5: sub ONE
jne wait_nextret6:
jmp wait_return6location:
wait_nextret6: sub ONE
jne wait_nextret7:
jmp wait_return7location:
wait_nextret7: sub ONE
jne wait_nextret8:
jmp wait_return8location:
wait_nextret8: sub ONE
jne wait_nextret9:
jmp wait_return9location:
wait_nextret9: sub ONE
jne wait_nextret10:
jmp wait_return10location:
wait_nextret10: sub ONE
jne wait_nextret11:
jmp wait_return11location:
wait_nextret11: sub ONE
jne wait_nextret12:
jmp wait_return12location:
wait_nextret12: sub ONE
jne wait_nextret13:
jmp wait_return13location:
wait_nextret13: sub ONE
jne wait_nextret14:
jmp wait_return14location:
wait_nextret14: sub ONE
jne wait_nextret15:
jmp wait_return15location:
wait_nextret15: sub ONE
jne wait_nextret16:
jmp wait_return16location:
wait_nextret16: sub ONE
jne wait_nextret17:
jmp wait_return17location:
wait_nextret17: sub ONE
jne wait_nextret18:
jmp wait_return18location:
wait_nextret18: sub ONE
jne wait_nextret19:
jmp wait_return19location:
wait_nextret19: sub ONE
jne wait_nextret20:
jmp wait_return20location:
wait_nextret20: sub ONE
jne wait_nextret21:
jmp wait_return21location:
wait_nextret21: sub ONE
jne wait_nextret22:
jmp wait_return22location:
wait_nextret22: sub ONE
jne wait_nextret23:
jmp wait_return23location:
wait_nextret23: sub ONE
jne wait_nextret24:
jmp wait_return24location:
wait_nextret24: sub ONE
jne wait_nextret25:
jmp wait_return25location:
wait_nextret25: sub ONE
jne wait_nextret26:
jmp wait_return26location:
wait_nextret26: sub ONE
jne wait_nextret27:
jmp wait_return27location:
wait_nextret27: sub ONE
jne wait_nextret28:
jmp wait_return28location:
wait_nextret28: sub ONE
jne wait_nextret29:
jmp wait_return29location:
wait_nextret29: sub ONE
jne wait_nextret30:
jmp wait_return30location:
wait_nextret30: sub ONE
jne wait_nextret31:
jmp wait_return31location:
wait_nextret31: sub ONE
jne wait_nextret32:
jmp wait_return32location:
wait_nextret32: sub ONE
jne wait_nextret33:
jmp wait_return33location:
wait_nextret33: sub ONE
jne wait_nextret34:
jmp wait_return34location:
wait_nextret34: jmp wait_return35location:
funcbegin_write_dealer: lda char_d
sta &ffa
lda char_e
sta &ff9
lda char_a
sta &ff8
lda char_l
sta &ff7
lda char_e
sta &ff6
lda char_r
sta &ff5
lda write_dealer_returnnum
jne write_dealer_nextret0:
jmp write_dealer_return0location:
write_dealer_nextret0: sub ONE
jne write_dealer_nextret1:
jmp write_dealer_return1location:
write_dealer_nextret1: jmp write_dealer_return2location:
funcbegin_write_turn: lda zero
sta &ffa
lda zero
sta &ff9
lda char_t
sta &ff8
lda char_u
sta &ff7
lda char_r
sta &ff6
lda char_n
sta &ff5
lda write_turn_returnnum
jne write_turn_nextret0:
jmp write_turn_return0location:
write_turn_nextret0: jmp write_turn_return1location:
funcbegin_write_your: lda zero
sta &ffa
lda zero
sta &ff9
lda char_y
sta &ff8
lda char_o
sta &ff7
lda char_u
sta &ff6
lda char_r
sta &ff5
jmp write_your_return0location:
funcbegin_halve: lda zero
sta halve_count
lda zero
sta halve_out
halve_start: lda halve_count
add two
sta halve_count
lda halve_out
add one
sta halve_out
lda halve_num
sub halve_count
jge halve_if_0_check:
jmp halve_if_0_start:
halve_if_0_check: jne halve_endif_0:
halve_if_0_start: jmp halve_end:
halve_endif_0: jmp halve_start:
halve_end: lda halve_returnnum
jne halve_nextret0:
jmp halve_return0location:
halve_nextret0: sub ONE
jne halve_nextret1:
jmp halve_return1location:
halve_nextret1: sub ONE
jne halve_nextret2:
jmp halve_return2location:
halve_nextret2: sub ONE
jne halve_nextret3:
jmp halve_return3location:
halve_nextret3: sub ONE
jne halve_nextret4:
jmp halve_return4location:
halve_nextret4: jmp halve_return5location:
funcbegin_digit: lda digit_num
jne digit_endif_0:
lda zero_char
sta digit_out
jmp digit_end:
digit_endif_0: lda digit_num
sub one
jne digit_endif_1:
lda one_char
sta digit_out
jmp digit_end:
digit_endif_1: lda digit_num
sub two
jne digit_endif_2:
lda two_char
sta digit_out
jmp digit_end:
digit_endif_2: lda digit_num
sub three
jne digit_endif_3:
lda three_char
sta digit_out
jmp digit_end:
digit_endif_3: lda digit_num
sub four
jne digit_endif_4:
lda four_char
sta digit_out
jmp digit_end:
digit_endif_4: lda digit_num
sub five
jne digit_endif_5:
lda five_char
sta digit_out
jmp digit_end:
digit_endif_5: lda digit_num
sub six
jne digit_endif_6:
lda six_char
sta digit_out
jmp digit_end:
digit_endif_6: lda digit_num
sub seven
jne digit_endif_7:
lda seven_char
sta digit_out
jmp digit_end:
digit_endif_7: lda digit_num
sub eight
jne digit_endif_8:
lda eight_char
sta digit_out
jmp digit_end:
digit_endif_8: lda digit_num
sub nine
jne digit_endif_9:
lda nine_char
sta digit_out
jmp digit_end:
digit_endif_9: sta &fef
digit_end: lda digit_returnnum
jne digit_nextret0:
jmp digit_return0location:
digit_nextret0: sub ONE
jne digit_nextret1:
jmp digit_return1location:
digit_nextret1: sub ONE
jne digit_nextret2:
jmp digit_return2location:
digit_nextret2: sub ONE
jne digit_nextret3:
jmp digit_return3location:
digit_nextret3: jmp digit_return4location:
funcbegin_write_enter: lda zero
sta &ffa
lda char_e
sta &ff9
lda char_n
sta &ff8
lda char_t
sta &ff7
lda char_e
sta &ff6
lda char_r
sta &ff5
jmp write_enter_return0location:
funcbegin_write_num: lda zero
sta &ffa
lda zero
sta &ff9
lda zero
sta &ff8
lda char_n
sta &ff7
lda char_u
sta &ff6
lda char_m
sta &ff5
jmp write_num_return0location:
funcbegin_get_keypad: lda &ff2
sta get_keypad_copy
jge get_keypad_endif_0:
lda one
sta get_keypad_f
lda get_keypad_copy
add threetwosevensixeight
sta get_keypad_copy
jmp get_keypad_yes_f:
get_keypad_endif_0: lda zero
sta get_keypad_f
get_keypad_yes_f: lda get_keypad_copy
sub onesixthreeeightfour
jge get_keypad_endif_1:
lda zero
sta get_keypad_e
jmp get_keypad_no_e:
get_keypad_endif_1: lda one
sta get_keypad_e
lda get_keypad_copy
sub onesixthreeeightfour
sta get_keypad_copy
get_keypad_no_e: lda get_keypad_copy
sub eightoneninetwo
jge get_keypad_endif_2:
lda zero
sta get_keypad_d
jmp get_keypad_no_d:
get_keypad_endif_2: lda one
sta get_keypad_d
lda get_keypad_copy
sub eightoneninetwo
sta get_keypad_copy
get_keypad_no_d: lda get_keypad_copy
sub fourzeroninesix
jge get_keypad_endif_3:
lda zero
sta get_keypad_c
jmp get_keypad_no_c:
get_keypad_endif_3: lda one
sta get_keypad_c
lda get_keypad_copy
sub fourzeroninesix
sta get_keypad_copy
get_keypad_no_c: lda get_keypad_copy
sub twozerofoureight
jge get_keypad_endif_4:
lda zero
sta get_keypad_b
jmp get_keypad_no_b:
get_keypad_endif_4: lda one
sta get_keypad_b
lda get_keypad_copy
sub twozerofoureight
sta get_keypad_copy
get_keypad_no_b: lda get_keypad_copy
sub onezerotwofour
jge get_keypad_endif_5:
lda zero
sta get_keypad_a
jmp get_keypad_no_a:
get_keypad_endif_5: lda one
sta get_keypad_a
lda get_keypad_copy
sub onezerotwofour
sta get_keypad_copy
get_keypad_no_a: lda get_keypad_copy
sub fiveonetwo
jge get_keypad_endif_6:
lda zero
sta get_keypad_9
jmp get_keypad_no_9:
get_keypad_endif_6: lda one
sta get_keypad_9
lda get_keypad_copy
sub fiveonetwo
sta get_keypad_copy
get_keypad_no_9: lda get_keypad_copy
sub twofivesix
jge get_keypad_endif_7:
lda zero
sta get_keypad_8
jmp get_keypad_no_8:
get_keypad_endif_7: lda one
sta get_keypad_8
lda get_keypad_copy
sub twofivesix
sta get_keypad_copy
get_keypad_no_8: lda get_keypad_copy
sub onetwoeight
jge get_keypad_endif_8:
lda zero
sta get_keypad_7
jmp get_keypad_no_7:
get_keypad_endif_8: lda one
sta get_keypad_7
lda get_keypad_copy
sub onetwoeight
sta get_keypad_copy
get_keypad_no_7: lda get_keypad_copy
sub sixfour
jge get_keypad_endif_9:
lda zero
sta get_keypad_6
jmp get_keypad_no_6:
get_keypad_endif_9: lda one
sta get_keypad_6
lda get_keypad_copy
sub sixfour
sta get_keypad_copy
get_keypad_no_6: lda get_keypad_copy
sub threetwo
jge get_keypad_endif_10:
lda zero
sta get_keypad_5
jmp get_keypad_no_5:
get_keypad_endif_10: lda one
sta get_keypad_5
lda get_keypad_copy
sub threetwo
sta get_keypad_copy
get_keypad_no_5: lda get_keypad_copy
sub onesix
jge get_keypad_endif_11:
lda zero
sta get_keypad_4
jmp get_keypad_no_4:
get_keypad_endif_11: lda one
sta get_keypad_4
lda get_keypad_copy
sub onesix
sta get_keypad_copy
get_keypad_no_4: lda get_keypad_copy
sub eight
jge get_keypad_endif_12:
lda zero
sta get_keypad_3
jmp get_keypad_no_3:
get_keypad_endif_12: lda one
sta get_keypad_3
lda get_keypad_copy
sub eight
sta get_keypad_copy
get_keypad_no_3: lda get_keypad_copy
sub four
jge get_keypad_endif_13:
lda zero
sta get_keypad_2
jmp get_keypad_no_2:
get_keypad_endif_13: lda one
sta get_keypad_2
lda get_keypad_copy
sub four
sta get_keypad_copy
get_keypad_no_2: lda get_keypad_copy
sub two
jge get_keypad_endif_14:
lda zero
sta get_keypad_1
jmp get_keypad_no_1:
get_keypad_endif_14: lda one
sta get_keypad_1
lda get_keypad_copy
sub two
sta get_keypad_copy
get_keypad_no_1: lda get_keypad_copy
sub one
jge get_keypad_endif_15:
lda zero
sta get_keypad_0
jmp get_keypad_no_0:
get_keypad_endif_15: lda one
sta get_keypad_0
lda get_keypad_copy
sub one
sta get_keypad_copy
get_keypad_no_0: lda get_keypad_returnnum
jne get_keypad_nextret0:
jmp get_keypad_return0location:
get_keypad_nextret0: sub ONE
jne get_keypad_nextret1:
jmp get_keypad_return1location:
get_keypad_nextret1: sub ONE
jne get_keypad_nextret2:
jmp get_keypad_return2location:
get_keypad_nextret2: sub ONE
jne get_keypad_nextret3:
jmp get_keypad_return3location:
get_keypad_nextret3: jmp get_keypad_return4location:
funcbegin_multiply: lda zero
sta multiply_out
lda multiply_v2
sta multiply_v2_copy
multiply_start: lda zero
sub multiply_v2_copy
jge multiply_endif_0:
lda multiply_out
add multiply_v1
sta multiply_out
lda multiply_v2_copy
sub one
sta multiply_v2_copy
jmp multiply_start:
multiply_endif_0: lda multiply_returnnum
jne multiply_nextret0:
jmp multiply_return0location:
multiply_nextret0: sub ONE
jne multiply_nextret1:
jmp multiply_return1location:
multiply_nextret1: sub ONE
jne multiply_nextret2:
jmp multiply_return2location:
multiply_nextret2: sub ONE
jne multiply_nextret3:
jmp multiply_return3location:
multiply_nextret3: sub ONE
jne multiply_nextret4:
jmp multiply_return4location:
multiply_nextret4: sub ONE
jne multiply_nextret5:
jmp multiply_return5location:
multiply_nextret5: sub ONE
jne multiply_nextret6:
jmp multiply_return6location:
multiply_nextret6: sub ONE
jne multiply_nextret7:
jmp multiply_return7location:
multiply_nextret7: sub ONE
jne multiply_nextret8:
jmp multiply_return8location:
multiply_nextret8: jmp multiply_return9location:
funcbegin_write_nuh_uh: lda char_n
sta &ffa
lda char_u
sta &ff9
lda char_h
sta &ff8
lda zero
sta &ff7
lda char_u
sta &ff6
lda char_h
sta &ff5
lda zero
sta wait_returnnum
jmp funcbegin_wait:
wait_return0location: lda one
sta wait_returnnum
jmp funcbegin_wait:
wait_return1location: lda write_nuh_uh_returnnum
jne write_nuh_uh_nextret0:
jmp write_nuh_uh_return0location:
write_nuh_uh_nextret0: jmp write_nuh_uh_return1location:
funcbegin_random: lda randseed1
add randseed2
sta random_out
random_modloop: lda random_max
sub random_out
jge random_if_0_check:
jmp random_if_0_start:
random_if_0_check: jne random_endif_0:
random_if_0_start: lda random_out
sub random_max
sta random_out
jmp random_modloop:
random_endif_0: lda randseed2
sta randseed1
lda random_out
sta randseed2
lda random_returnnum
jne random_nextret0:
jmp random_return0location:
random_nextret0: jmp random_return1location:
funcbegin_write_ace: lda zero
sta &ffa
lda zero
sta &ff9
lda zero
sta &ff8
lda char_a
sta &ff7
lda char_c
sta &ff6
lda char_e
sta &ff5
jmp write_ace_return0location:
funcbegin_write_jack: lda zero
sta &ffa
lda zero
sta &ff9
lda char_j
sta &ff8
lda char_a
sta &ff7
lda char_c
sta &ff6
lda char_k
sta &ff5
jmp write_jack_return0location:
funcbegin_write_queen: lda zero
sta &ffa
lda char_q
sta &ff9
lda char_u
sta &ff8
lda char_e
sta &ff7
lda char_e
sta &ff6
lda char_n
sta &ff5
jmp write_queen_return0location:
funcbegin_write_king: lda zero
sta &ffa
lda zero
sta &ff9
lda char_k
sta &ff8
lda char_i
sta &ff7
lda char_n
sta &ff6
lda char_g
sta &ff5
jmp write_king_return0location:
funcbegin_write_of: lda zero
sta &ffa
lda zero
sta &ff9
lda zero
sta &ff8
lda zero
sta &ff7
lda char_o
sta &ff6
lda char_f
sta &ff5
jmp write_of_return0location:
funcbegin_write_clubs: lda zero
sta &ffa
lda char_c
sta &ff9
lda char_l
sta &ff8
lda char_u
sta &ff7
lda char_b
sta &ff6
lda char_s
sta &ff5
jmp write_clubs_return0location:
funcbegin_write_dias: lda zero
sta &ffa
lda zero
sta &ff9
lda char_d
sta &ff8
lda char_i
sta &ff7
lda char_a
sta &ff6
lda char_s
sta &ff5
jmp write_dias_return0location:
funcbegin_write_hearts: lda char_h
sta &ffa
lda char_e
sta &ff9
lda char_a
sta &ff8
lda char_r
sta &ff7
lda char_t
sta &ff6
lda char_s
sta &ff5
jmp write_hearts_return0location:
funcbegin_write_spades: lda char_s
sta &ffa
lda char_p
sta &ff9
lda char_a
sta &ff8
lda char_d
sta &ff7
lda char_e
sta &ff6
lda char_s
sta &ff5
jmp write_spades_return0location:
funcbegin_write_got: lda zero
sta &ffa
lda zero
sta &ff9
lda zero
sta &ff8
lda char_g
sta &ff7
lda char_o
sta &ff6
lda char_t
sta &ff5
lda write_got_returnnum
jne write_got_nextret0:
jmp write_got_return0location:
write_got_nextret0: jmp write_got_return1location:
funcbegin_draw_card: lda draw_card_cards_available
sta random_max
lda zero
sta random_returnnum
jmp funcbegin_random:
random_return0location: lda random_out
sta draw_card_rand
lda draw_card_0
jne draw_card_endif_0:
lda draw_card_rand
jne draw_card_endif_1:
lda zero
sta draw_card_card
lda one
sta draw_card_0
jmp draw_card_end:
draw_card_endif_1: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_0: lda draw_card_1
jne draw_card_endif_2:
lda draw_card_rand
jne draw_card_endif_3:
lda one
sta draw_card_card
lda one
sta draw_card_1
jmp draw_card_end:
draw_card_endif_3: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_2: lda draw_card_2
jne draw_card_endif_4:
lda draw_card_rand
jne draw_card_endif_5:
lda two
sta draw_card_card
lda one
sta draw_card_2
jmp draw_card_end:
draw_card_endif_5: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_4: lda draw_card_3
jne draw_card_endif_6:
lda draw_card_rand
jne draw_card_endif_7:
lda three
sta draw_card_card
lda one
sta draw_card_3
jmp draw_card_end:
draw_card_endif_7: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_6: lda draw_card_4
jne draw_card_endif_8:
lda draw_card_rand
jne draw_card_endif_9:
lda four
sta draw_card_card
lda one
sta draw_card_4
jmp draw_card_end:
draw_card_endif_9: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_8: lda draw_card_5
jne draw_card_endif_10:
lda draw_card_rand
jne draw_card_endif_11:
lda five
sta draw_card_card
lda one
sta draw_card_5
jmp draw_card_end:
draw_card_endif_11: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_10: lda draw_card_6
jne draw_card_endif_12:
lda draw_card_rand
jne draw_card_endif_13:
lda six
sta draw_card_card
lda one
sta draw_card_6
jmp draw_card_end:
draw_card_endif_13: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_12: lda draw_card_7
jne draw_card_endif_14:
lda draw_card_rand
jne draw_card_endif_15:
lda seven
sta draw_card_card
lda one
sta draw_card_7
jmp draw_card_end:
draw_card_endif_15: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_14: lda draw_card_8
jne draw_card_endif_16:
lda draw_card_rand
jne draw_card_endif_17:
lda eight
sta draw_card_card
lda one
sta draw_card_8
jmp draw_card_end:
draw_card_endif_17: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_16: lda draw_card_9
jne draw_card_endif_18:
lda draw_card_rand
jne draw_card_endif_19:
lda nine
sta draw_card_card
lda one
sta draw_card_9
jmp draw_card_end:
draw_card_endif_19: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_18: lda draw_card_10
jne draw_card_endif_20:
lda draw_card_rand
jne draw_card_endif_21:
lda onezero
sta draw_card_card
lda one
sta draw_card_10
jmp draw_card_end:
draw_card_endif_21: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_20: lda draw_card_11
jne draw_card_endif_22:
lda draw_card_rand
jne draw_card_endif_23:
lda oneone
sta draw_card_card
lda one
sta draw_card_11
jmp draw_card_end:
draw_card_endif_23: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_22: lda draw_card_12
jne draw_card_endif_24:
lda draw_card_rand
jne draw_card_endif_25:
lda onetwo
sta draw_card_card
lda one
sta draw_card_12
jmp draw_card_end:
draw_card_endif_25: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_24: lda draw_card_13
jne draw_card_endif_26:
lda draw_card_rand
jne draw_card_endif_27:
lda onethree
sta draw_card_card
lda one
sta draw_card_13
jmp draw_card_end:
draw_card_endif_27: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_26: lda draw_card_14
jne draw_card_endif_28:
lda draw_card_rand
jne draw_card_endif_29:
lda onefour
sta draw_card_card
lda one
sta draw_card_14
jmp draw_card_end:
draw_card_endif_29: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_28: lda draw_card_15
jne draw_card_endif_30:
lda draw_card_rand
jne draw_card_endif_31:
lda onefive
sta draw_card_card
lda one
sta draw_card_15
jmp draw_card_end:
draw_card_endif_31: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_30: lda draw_card_16
jne draw_card_endif_32:
lda draw_card_rand
jne draw_card_endif_33:
lda onesix
sta draw_card_card
lda one
sta draw_card_16
jmp draw_card_end:
draw_card_endif_33: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_32: lda draw_card_17
jne draw_card_endif_34:
lda draw_card_rand
jne draw_card_endif_35:
lda oneseven
sta draw_card_card
lda one
sta draw_card_17
jmp draw_card_end:
draw_card_endif_35: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_34: lda draw_card_18
jne draw_card_endif_36:
lda draw_card_rand
jne draw_card_endif_37:
lda oneeight
sta draw_card_card
lda one
sta draw_card_18
jmp draw_card_end:
draw_card_endif_37: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_36: lda draw_card_19
jne draw_card_endif_38:
lda draw_card_rand
jne draw_card_endif_39:
lda onenine
sta draw_card_card
lda one
sta draw_card_19
jmp draw_card_end:
draw_card_endif_39: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_38: lda draw_card_20
jne draw_card_endif_40:
lda draw_card_rand
jne draw_card_endif_41:
lda twozero
sta draw_card_card
lda one
sta draw_card_20
jmp draw_card_end:
draw_card_endif_41: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_40: lda draw_card_21
jne draw_card_endif_42:
lda draw_card_rand
jne draw_card_endif_43:
lda twoone
sta draw_card_card
lda one
sta draw_card_21
jmp draw_card_end:
draw_card_endif_43: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_42: lda draw_card_22
jne draw_card_endif_44:
lda draw_card_rand
jne draw_card_endif_45:
lda twotwo
sta draw_card_card
lda one
sta draw_card_22
jmp draw_card_end:
draw_card_endif_45: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_44: lda draw_card_23
jne draw_card_endif_46:
lda draw_card_rand
jne draw_card_endif_47:
lda twothree
sta draw_card_card
lda one
sta draw_card_23
jmp draw_card_end:
draw_card_endif_47: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_46: lda draw_card_24
jne draw_card_endif_48:
lda draw_card_rand
jne draw_card_endif_49:
lda twofour
sta draw_card_card
lda one
sta draw_card_24
jmp draw_card_end:
draw_card_endif_49: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_48: lda draw_card_25
jne draw_card_endif_50:
lda draw_card_rand
jne draw_card_endif_51:
lda twofive
sta draw_card_card
lda one
sta draw_card_25
jmp draw_card_end:
draw_card_endif_51: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_50: lda draw_card_26
jne draw_card_endif_52:
lda draw_card_rand
jne draw_card_endif_53:
lda twosix
sta draw_card_card
lda one
sta draw_card_26
jmp draw_card_end:
draw_card_endif_53: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_52: lda draw_card_27
jne draw_card_endif_54:
lda draw_card_rand
jne draw_card_endif_55:
lda twoseven
sta draw_card_card
lda one
sta draw_card_27
jmp draw_card_end:
draw_card_endif_55: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_54: lda draw_card_28
jne draw_card_endif_56:
lda draw_card_rand
jne draw_card_endif_57:
lda twoeight
sta draw_card_card
lda one
sta draw_card_28
jmp draw_card_end:
draw_card_endif_57: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_56: lda draw_card_29
jne draw_card_endif_58:
lda draw_card_rand
jne draw_card_endif_59:
lda twonine
sta draw_card_card
lda one
sta draw_card_29
jmp draw_card_end:
draw_card_endif_59: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_58: lda draw_card_30
jne draw_card_endif_60:
lda draw_card_rand
jne draw_card_endif_61:
lda threezero
sta draw_card_card
lda one
sta draw_card_30
jmp draw_card_end:
draw_card_endif_61: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_60: lda draw_card_31
jne draw_card_endif_62:
lda draw_card_rand
jne draw_card_endif_63:
lda threeone
sta draw_card_card
lda one
sta draw_card_31
jmp draw_card_end:
draw_card_endif_63: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_62: lda draw_card_32
jne draw_card_endif_64:
lda draw_card_rand
jne draw_card_endif_65:
lda threetwo
sta draw_card_card
lda one
sta draw_card_32
jmp draw_card_end:
draw_card_endif_65: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_64: lda draw_card_33
jne draw_card_endif_66:
lda draw_card_rand
jne draw_card_endif_67:
lda threethree
sta draw_card_card
lda one
sta draw_card_33
jmp draw_card_end:
draw_card_endif_67: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_66: lda draw_card_34
jne draw_card_endif_68:
lda draw_card_rand
jne draw_card_endif_69:
lda threefour
sta draw_card_card
lda one
sta draw_card_34
jmp draw_card_end:
draw_card_endif_69: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_68: lda draw_card_35
jne draw_card_endif_70:
lda draw_card_rand
jne draw_card_endif_71:
lda threefive
sta draw_card_card
lda one
sta draw_card_35
jmp draw_card_end:
draw_card_endif_71: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_70: lda draw_card_36
jne draw_card_endif_72:
lda draw_card_rand
jne draw_card_endif_73:
lda threesix
sta draw_card_card
lda one
sta draw_card_36
jmp draw_card_end:
draw_card_endif_73: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_72: lda draw_card_37
jne draw_card_endif_74:
lda draw_card_rand
jne draw_card_endif_75:
lda threeseven
sta draw_card_card
lda one
sta draw_card_37
jmp draw_card_end:
draw_card_endif_75: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_74: lda draw_card_38
jne draw_card_endif_76:
lda draw_card_rand
jne draw_card_endif_77:
lda threeeight
sta draw_card_card
lda one
sta draw_card_38
jmp draw_card_end:
draw_card_endif_77: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_76: lda draw_card_39
jne draw_card_endif_78:
lda draw_card_rand
jne draw_card_endif_79:
lda threenine
sta draw_card_card
lda one
sta draw_card_39
jmp draw_card_end:
draw_card_endif_79: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_78: lda draw_card_40
jne draw_card_endif_80:
lda draw_card_rand
jne draw_card_endif_81:
lda fourzero
sta draw_card_card
lda one
sta draw_card_40
jmp draw_card_end:
draw_card_endif_81: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_80: lda draw_card_41
jne draw_card_endif_82:
lda draw_card_rand
jne draw_card_endif_83:
lda fourone
sta draw_card_card
lda one
sta draw_card_41
jmp draw_card_end:
draw_card_endif_83: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_82: lda draw_card_42
jne draw_card_endif_84:
lda draw_card_rand
jne draw_card_endif_85:
lda fourtwo
sta draw_card_card
lda one
sta draw_card_42
jmp draw_card_end:
draw_card_endif_85: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_84: lda draw_card_43
jne draw_card_endif_86:
lda draw_card_rand
jne draw_card_endif_87:
lda fourthree
sta draw_card_card
lda one
sta draw_card_43
jmp draw_card_end:
draw_card_endif_87: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_86: lda draw_card_44
jne draw_card_endif_88:
lda draw_card_rand
jne draw_card_endif_89:
lda fourfour
sta draw_card_card
lda one
sta draw_card_44
jmp draw_card_end:
draw_card_endif_89: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_88: lda draw_card_45
jne draw_card_endif_90:
lda draw_card_rand
jne draw_card_endif_91:
lda fourfive
sta draw_card_card
lda one
sta draw_card_45
jmp draw_card_end:
draw_card_endif_91: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_90: lda draw_card_46
jne draw_card_endif_92:
lda draw_card_rand
jne draw_card_endif_93:
lda foursix
sta draw_card_card
lda one
sta draw_card_46
jmp draw_card_end:
draw_card_endif_93: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_92: lda draw_card_47
jne draw_card_endif_94:
lda draw_card_rand
jne draw_card_endif_95:
lda fourseven
sta draw_card_card
lda one
sta draw_card_47
jmp draw_card_end:
draw_card_endif_95: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_94: lda draw_card_48
jne draw_card_endif_96:
lda draw_card_rand
jne draw_card_endif_97:
lda foureight
sta draw_card_card
lda one
sta draw_card_48
jmp draw_card_end:
draw_card_endif_97: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_96: lda draw_card_49
jne draw_card_endif_98:
lda draw_card_rand
jne draw_card_endif_99:
lda fournine
sta draw_card_card
lda one
sta draw_card_49
jmp draw_card_end:
draw_card_endif_99: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_98: lda draw_card_50
jne draw_card_endif_100:
lda draw_card_rand
jne draw_card_endif_101:
lda fivezero
sta draw_card_card
lda one
sta draw_card_50
jmp draw_card_end:
draw_card_endif_101: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_100: lda draw_card_51
jne draw_card_endif_102:
lda draw_card_rand
jne draw_card_endif_103:
lda fiveone
sta draw_card_card
lda one
sta draw_card_51
jmp draw_card_end:
draw_card_endif_103: lda draw_card_rand
sub one
sta draw_card_rand
draw_card_endif_102: sta &fef
draw_card_end: lda draw_card_returnnum
jne draw_card_nextret0:
jmp draw_card_return0location:
draw_card_nextret0: jmp draw_card_return1location:
funcbegin_print_card: lda threeeight
sub print_card_card
jge print_card_endif_0:
lda print_card_card
sub threeseven
sta print_card_value
lda four
sta print_card_suit
jmp print_card_values_done:
print_card_endif_0: lda twofive
sub print_card_card
jge print_card_endif_1:
lda print_card_card
sub twofour
sta print_card_value
lda three
sta print_card_suit
jmp print_card_values_done:
print_card_endif_1: lda onetwo
sub print_card_card
jge print_card_endif_2:
lda print_card_card
sub oneone
sta print_card_value
lda two
sta print_card_suit
jmp print_card_values_done:
print_card_endif_2: lda print_card_card
add one
sta print_card_value
lda one
sta print_card_suit
print_card_values_done: lda print_card_value
sub one
jne print_card_endif_3:
lda zero
sta write_ace_returnnum
jmp funcbegin_write_ace:
write_ace_return0location: jmp print_card_print_value_done:
print_card_endif_3: lda print_card_value
sub oneone
jne print_card_endif_4:
lda zero
sta write_jack_returnnum
jmp funcbegin_write_jack:
write_jack_return0location: jmp print_card_print_value_done:
print_card_endif_4: lda print_card_value
sub onetwo
jne print_card_endif_5:
lda zero
sta write_queen_returnnum
jmp funcbegin_write_queen:
write_queen_return0location: jmp print_card_print_value_done:
print_card_endif_5: lda print_card_value
sub onethree
jne print_card_endif_6:
lda zero
sta write_king_returnnum
jmp funcbegin_write_king:
write_king_return0location: jmp print_card_print_value_done:
print_card_endif_6: lda print_card_value
sta display_num_num
lda two
sta display_num_returnnum
jmp funcbegin_display_num:
display_num_return2location: sta &fef
print_card_print_value_done: lda oneone
sta wait_returnnum
jmp funcbegin_wait:
wait_return11location: lda zero
sta write_of_returnnum
jmp funcbegin_write_of:
write_of_return0location: lda onetwo
sta wait_returnnum
jmp funcbegin_wait:
wait_return12location: lda print_card_suit
sub one
jne print_card_endif_7:
lda zero
sta write_clubs_returnnum
jmp funcbegin_write_clubs:
write_clubs_return0location: jmp print_card_end:
print_card_endif_7: lda print_card_suit
sub two
jne print_card_endif_8:
lda zero
sta write_dias_returnnum
jmp funcbegin_write_dias:
write_dias_return0location: jmp print_card_end:
print_card_endif_8: lda print_card_suit
sub three
jne print_card_endif_9:
lda zero
sta write_hearts_returnnum
jmp funcbegin_write_hearts:
write_hearts_return0location: jmp print_card_end:
print_card_endif_9: lda zero
sta write_spades_returnnum
jmp funcbegin_write_spades:
write_spades_return0location: sta &fef
print_card_end: lda onethree
sta wait_returnnum
jmp funcbegin_wait:
wait_return13location: lda print_card_returnnum
jne print_card_nextret0:
jmp print_card_return0location:
print_card_nextret0: jmp print_card_return1location:
funcbegin_reset_cards: lda zero
sta draw_card_0
lda zero
sta draw_card_1
lda zero
sta draw_card_2
lda zero
sta draw_card_3
lda zero
sta draw_card_4
lda zero
sta draw_card_5
lda zero
sta draw_card_6
lda zero
sta draw_card_7
lda zero
sta draw_card_8
lda zero
sta draw_card_9
lda zero
sta draw_card_10
lda zero
sta draw_card_11
lda zero
sta draw_card_12
lda zero
sta draw_card_13
lda zero
sta draw_card_14
lda zero
sta draw_card_15
lda zero
sta draw_card_16
lda zero
sta draw_card_17
lda zero
sta draw_card_18
lda zero
sta draw_card_19
lda zero
sta draw_card_20
lda zero
sta draw_card_21
lda zero
sta draw_card_22
lda zero
sta draw_card_23
lda zero
sta draw_card_24
lda zero
sta draw_card_25
lda zero
sta draw_card_26
lda zero
sta draw_card_27
lda zero
sta draw_card_28
lda zero
sta draw_card_29
lda zero
sta draw_card_30
lda zero
sta draw_card_31
lda zero
sta draw_card_32
lda zero
sta draw_card_33
lda zero
sta draw_card_34
lda zero
sta draw_card_35
lda zero
sta draw_card_36
lda zero
sta draw_card_37
lda zero
sta draw_card_38
lda zero
sta draw_card_39
lda zero
sta draw_card_40
lda zero
sta draw_card_41
lda zero
sta draw_card_42
lda zero
sta draw_card_43
lda zero
sta draw_card_44
lda zero
sta draw_card_45
lda zero
sta draw_card_46
lda zero
sta draw_card_47
lda zero
sta draw_card_48
lda zero
sta draw_card_49
lda zero
sta draw_card_50
lda zero
sta draw_card_51
lda fivetwo
sta draw_card_cards_available
jmp reset_cards_return0location:
funcbegin_print_dealers_turn: lda two
sta wait_returnnum
jmp funcbegin_wait:
wait_return2location: lda zero
sta write_dealer_returnnum
jmp funcbegin_write_dealer:
write_dealer_return0location: lda three
sta wait_returnnum
jmp funcbegin_wait:
wait_return3location: lda zero
sta write_turn_returnnum
jmp funcbegin_write_turn:
write_turn_return0location: lda four
sta wait_returnnum
jmp funcbegin_wait:
wait_return4location: lda five
sta wait_returnnum
jmp funcbegin_wait:
wait_return5location: lda print_dealers_turn_returnnum
jne print_dealers_turn_nextret0:
jmp print_dealers_turn_return0location:
print_dealers_turn_nextret0: jmp print_dealers_turn_return1location:
funcbegin_dealer_play: lda one
sta write_dealer_returnnum
jmp funcbegin_write_dealer:
write_dealer_return1location: lda onefour
sta wait_returnnum
jmp funcbegin_wait:
wait_return14location: lda zero
sta write_got_returnnum
jmp funcbegin_write_got:
write_got_return0location: lda onefive
sta wait_returnnum
jmp funcbegin_wait:
wait_return15location: lda zero
sta draw_card_returnnum
jmp funcbegin_draw_card:
draw_card_return0location: lda draw_card_card
sta print_card_card
lda zero
sta print_card_returnnum
jmp funcbegin_print_card:
print_card_return0location: lda begin_round_dealer_value
add print_card_value
sta begin_round_dealer_value
lda onesix
sta wait_returnnum
jmp funcbegin_wait:
wait_return16location: lda oneseven
sta wait_returnnum
jmp funcbegin_wait:
wait_return17location: lda dealer_play_returnnum
jne dealer_play_nextret0:
jmp dealer_play_return0location:
dealer_play_nextret0: jmp dealer_play_return1location:
funcbegin_print_your_turn: lda six
sta wait_returnnum
jmp funcbegin_wait:
wait_return6location: lda zero
sta write_your_returnnum
jmp funcbegin_write_your:
write_your_return0location: lda seven
sta wait_returnnum
jmp funcbegin_wait:
wait_return7location: lda one
sta write_turn_returnnum
jmp funcbegin_write_turn:
write_turn_return1location: lda eight
sta wait_returnnum
jmp funcbegin_wait:
wait_return8location: lda nine
sta wait_returnnum
jmp funcbegin_wait:
wait_return9location: jmp print_your_turn_return0location:
funcbegin_write_you: lda zero
sta &ffa
lda zero
sta &ff9
lda zero
sta &ff8
lda char_y
sta &ff7
lda char_o
sta &ff6
lda char_u
sta &ff5
lda write_you_returnnum
jne write_you_nextret0:
jmp write_you_return0location:
write_you_nextret0: sub ONE
jne write_you_nextret1:
jmp write_you_return1location:
write_you_nextret1: jmp write_you_return2location:
funcbegin_write_bust: lda zero
sta &ffa
lda zero
sta &ff9
lda char_b
sta &ff8
lda char_u
sta &ff7
lda char_s
sta &ff6
lda char_t
sta &ff5
lda write_bust_returnnum
jne write_bust_nextret0:
jmp write_bust_return0location:
write_bust_nextret0: jmp write_bust_return1location:
funcbegin_write_hit: lda zero
sta &ffa
lda zero
sta &ff9
lda zero
sta &ff8
lda char_h
sta &ff7
lda char_i
sta &ff6
lda char_t
sta &ff5
lda write_hit_returnnum
jne write_hit_nextret0:
jmp write_hit_return0location:
write_hit_nextret0: jmp write_hit_return1location:
funcbegin_write_or: lda zero
sta &ffa
lda zero
sta &ff9
lda zero
sta &ff8
lda zero
sta &ff7
lda char_o
sta &ff6
lda char_r
sta &ff5
jmp write_or_return0location:
funcbegin_write_stand: lda char_s
sta &ffa
lda char_t
sta &ff9
lda char_a
sta &ff8
lda char_n
sta &ff7
lda char_d
sta &ff6
lda char_ques
sta &ff5
jmp write_stand_return0location:
funcbegin_write_win: lda zero
sta &ffa
lda zero
sta &ff9
lda zero
sta &ff8
lda char_w
sta &ff7
lda char_i
sta &ff6
lda char_n
sta &ff5
lda write_win_returnnum
jne write_win_nextret0:
jmp write_win_return0location:
write_win_nextret0: jmp write_win_return1location:
funcbegin_write_lose: lda zero
sta &ffa
lda zero
sta &ff9
lda char_l
sta &ff8
lda char_o
sta &ff7
lda char_s
sta &ff6
lda char_e
sta &ff5
jmp write_lose_return0location:
funcbegin_time1sec: lda 1_sec_beep
sta &ffd
time1sec_startCount: lda &ff3
sub one
jne time1sec_endif_0:
lda time1sec_count
add one
sta time1sec_count
sub threezerozerozerozero
jne time1sec_endif_1:
lda zero
sta time1sec_count
lda time1sec_count2
add one
sta time1sec_count2
sub threezerozerozerozero
jne time1sec_endif_2:
lda zero
sta time1sec_count2
lda time1sec_count3
add one
sta time1sec_count3
time1sec_endif_2: sta &fef
time1sec_endif_1: jmp time1sec_startCount:
time1sec_endif_0: jmp time1sec_return0location:
funcbegin_wait_half_init: lda zero
sub time1sec_count3
jge wait_half_init_endif_0:
lda time1sec_count3
sta halve_num
lda zero
sta halve_returnnum
jmp funcbegin_halve:
halve_return0location: lda halve_out
sta halve_num
lda one
sta halve_returnnum
jmp funcbegin_halve:
halve_return1location: lda halve_out
sta wait_half_init_out_out_loop
wait_half_init_endif_0: lda zero
sub time1sec_count2
jge wait_half_init_endif_1:
lda time1sec_count2
sta halve_num
lda two
sta halve_returnnum
jmp funcbegin_halve:
halve_return2location: lda halve_out
sta halve_num
lda three
sta halve_returnnum
jmp funcbegin_halve:
halve_return3location: lda halve_out
sta wait_half_init_out_loop
wait_half_init_endif_1: lda time1sec_count
sta halve_num
lda four
sta halve_returnnum
jmp funcbegin_halve:
halve_return4location: lda halve_out
sta halve_num
lda five
sta halve_returnnum
jmp funcbegin_halve:
halve_return5location: lda halve_out
sta wait_half_init_in_loop
jmp wait_half_init_return0location:
funcbegin_print_welcome: lda zero
sta print_welcome_char0
lda zero
sta print_welcome_char1
lda zero
sta print_welcome_char2
lda zero
sta print_welcome_char3
lda zero
sta print_welcome_char4
lda zero
sta print_welcome_char5
lda zero
sta print_welcome_progress
lda print_welcome_length
add six
sta print_welcome_maxProgress
print_welcome_train: lda print_welcome_char4
sta print_welcome_char5
lda print_welcome_char3
sta print_welcome_char4
lda print_welcome_char2
sta print_welcome_char3
lda print_welcome_char1
sta print_welcome_char2
lda print_welcome_char0
sta print_welcome_char1
lda print_welcome_progress
jne print_welcome_endif_0:
lda print_welcome_c_0
sta print_welcome_char0
jmp print_welcome_train_end:
print_welcome_endif_0: lda print_welcome_progress
sub one
jne print_welcome_endif_1:
lda print_welcome_c_1
sta print_welcome_char0
jmp print_welcome_train_end:
print_welcome_endif_1: lda print_welcome_progress
sub two
jne print_welcome_endif_2:
lda print_welcome_c_2
sta print_welcome_char0
jmp print_welcome_train_end:
print_welcome_endif_2: lda print_welcome_progress
sub three
jne print_welcome_endif_3:
lda print_welcome_c_3
sta print_welcome_char0
jmp print_welcome_train_end:
print_welcome_endif_3: lda print_welcome_progress
sub four
jne print_welcome_endif_4:
lda print_welcome_c_4
sta print_welcome_char0
jmp print_welcome_train_end:
print_welcome_endif_4: lda print_welcome_progress
sub five
jne print_welcome_endif_5:
lda print_welcome_c_5
sta print_welcome_char0
jmp print_welcome_train_end:
print_welcome_endif_5: lda print_welcome_progress
sub six
jne print_welcome_endif_6:
lda print_welcome_c_6
sta print_welcome_char0
jmp print_welcome_train_end:
print_welcome_endif_6: lda print_welcome_progress
sub seven
jne print_welcome_endif_7:
lda print_welcome_c_7
sta print_welcome_char0
jmp print_welcome_train_end:
print_welcome_endif_7: lda print_welcome_progress
sub eight
jne print_welcome_endif_8:
lda print_welcome_c_8
sta print_welcome_char0
jmp print_welcome_train_end:
print_welcome_endif_8: lda print_welcome_progress
sub nine
jne print_welcome_endif_9:
lda print_welcome_c_9
sta print_welcome_char0
jmp print_welcome_train_end:
print_welcome_endif_9: lda print_welcome_progress
sub onezero
jne print_welcome_endif_10:
lda print_welcome_c_10
sta print_welcome_char0
jmp print_welcome_train_end:
print_welcome_endif_10: lda print_welcome_progress
sub oneone
jne print_welcome_endif_11:
lda print_welcome_c_11
sta print_welcome_char0
jmp print_welcome_train_end:
print_welcome_endif_11: lda print_welcome_progress
sub onetwo
jne print_welcome_endif_12:
lda print_welcome_c_12
sta print_welcome_char0
jmp print_welcome_train_end:
print_welcome_endif_12: lda print_welcome_progress
sub onethree
jne print_welcome_endif_13:
lda print_welcome_c_13
sta print_welcome_char0
jmp print_welcome_train_end:
print_welcome_endif_13: lda print_welcome_progress
sub onefour
jne print_welcome_endif_14:
lda print_welcome_c_14
sta print_welcome_char0
jmp print_welcome_train_end:
print_welcome_endif_14: lda print_welcome_progress
sub onefive
jne print_welcome_endif_15:
lda print_welcome_c_15
sta print_welcome_char0
jmp print_welcome_train_end:
print_welcome_endif_15: lda print_welcome_progress
sub onesix
jne print_welcome_endif_16:
lda print_welcome_c_16
sta print_welcome_char0
jmp print_welcome_train_end:
print_welcome_endif_16: lda print_welcome_progress
sub oneseven
jne print_welcome_endif_17:
lda print_welcome_c_17
sta print_welcome_char0
jmp print_welcome_train_end:
print_welcome_endif_17: lda print_welcome_progress
sub oneeight
jne print_welcome_endif_18:
lda print_welcome_c_18
sta print_welcome_char0
jmp print_welcome_train_end:
print_welcome_endif_18: lda print_welcome_progress
sub onenine
jne print_welcome_endif_19:
lda print_welcome_c_19
sta print_welcome_char0
jmp print_welcome_train_end:
print_welcome_endif_19: lda print_welcome_progress
sub twozero
jne print_welcome_endif_20:
lda print_welcome_c_20
sta print_welcome_char0
jmp print_welcome_train_end:
print_welcome_endif_20: lda print_welcome_progress
sub twoone
jne print_welcome_endif_21:
lda print_welcome_c_21
sta print_welcome_char0
jmp print_welcome_train_end:
print_welcome_endif_21: lda print_welcome_progress
sub twotwo
jne print_welcome_endif_22:
lda print_welcome_c_22
sta print_welcome_char0
jmp print_welcome_train_end:
print_welcome_endif_22: lda print_welcome_progress
sub twothree
jne print_welcome_endif_23:
lda print_welcome_c_23
sta print_welcome_char0
jmp print_welcome_train_end:
print_welcome_endif_23: lda print_welcome_progress
sub twofour
jne print_welcome_endif_24:
lda print_welcome_c_24
sta print_welcome_char0
jmp print_welcome_train_end:
print_welcome_endif_24: lda print_welcome_progress
sub twofive
jne print_welcome_endif_25:
lda print_welcome_c_25
sta print_welcome_char0
jmp print_welcome_train_end:
print_welcome_endif_25: lda zero
sta print_welcome_char0
print_welcome_train_end: lda print_welcome_char5
sta &ffa
lda print_welcome_char4
sta &ff9
lda print_welcome_char3
sta &ff8
lda print_welcome_char2
sta &ff7
lda print_welcome_char1
sta &ff6
lda print_welcome_char0
sta &ff5
lda five
sta wait_half_returnnum
jmp funcbegin_wait_half:
wait_half_return5location: lda print_welcome_progress
add one
sta print_welcome_progress
sub print_welcome_maxProgress
jge print_welcome_if_26_check:
jmp print_welcome_if_26_start:
print_welcome_if_26_check: lda print_welcome_maxProgress
sub print_welcome_progress
jge print_welcome_endif_26:
print_welcome_if_26_start: jmp print_welcome_train:
print_welcome_endif_26: jmp print_welcome_return0location:
funcbegin_write_money_text: lda zero
sta &ffa
lda char_m
sta &ff9
lda char_o
sta &ff8
lda char_n
sta &ff7
lda char_e
sta &ff6
lda char_y
sta &ff5
jmp write_money_text_return0location:
funcbegin_print_controls: lda zero
sta print_c_for_controls_returnnum
jmp funcbegin_print_c_for_controls:
print_c_for_controls_return0location: lda zero
sta print_b_control_returnnum
jmp funcbegin_print_b_control:
print_b_control_return0location: lda zero
sta print_a_control_returnnum
jmp funcbegin_print_a_control:
print_a_control_return0location: lda zero
sta print_f_control_returnnum
jmp funcbegin_print_f_control:
print_f_control_return0location: lda zero
sta print_e_control_returnnum
jmp funcbegin_print_e_control:
print_e_control_return0location: lda print_controls_returnnum
jne print_controls_nextret0:
jmp print_controls_return0location:
print_controls_nextret0: jmp print_controls_return1location:
funcbegin_place_bet: sta &fef
place_bet_start: lda zero
sta place_bet_bet
lda zero
sta place_bet_entered_characters
lda zero
sta write_enter_returnnum
jmp funcbegin_write_enter:
write_enter_return0location: lda onezero
sta wait_returnnum
jmp funcbegin_wait:
wait_return10location: lda six
sta wait_half_returnnum
jmp funcbegin_wait_half:
wait_half_return6location: lda zero
sta write_num_returnnum
jmp funcbegin_write_num:
write_num_return0location: lda onezero
sta multiply_v2
place_bet_type_loop: lda zero
sta get_keypad_returnnum
jmp funcbegin_get_keypad:
get_keypad_return0location: lda get_keypad_0
sub one
jne place_bet_endif_0:
lda place_bet_prev_press_0
sub one
jne place_bet_endif_1:
jmp place_bet_nothing_pressed:
place_bet_endif_1: lda place_bet_entered_characters
jne place_bet_endif_2:
jmp place_bet_type_loop:
place_bet_endif_2: lda place_bet_bet
sta multiply_v1
lda onezero
sta multiply_v2
lda zero
sta multiply_returnnum
jmp funcbegin_multiply:
multiply_return0location: lda multiply_out
sta place_bet_bet
jmp place_bet_type_add:
place_bet_endif_0: lda get_keypad_1
sub one
jne place_bet_endif_3:
lda place_bet_prev_press_1
sub one
jne place_bet_endif_4:
jmp place_bet_nothing_pressed:
place_bet_endif_4: lda place_bet_bet
sta multiply_v1
lda one
sta multiply_returnnum
jmp funcbegin_multiply:
multiply_return1location: lda multiply_out
sta place_bet_bet
add one
sta place_bet_bet
jmp place_bet_type_add:
place_bet_endif_3: lda get_keypad_2
sub one
jne place_bet_endif_5:
lda place_bet_prev_press_2
sub one
jne place_bet_endif_6:
jmp place_bet_nothing_pressed:
place_bet_endif_6: lda place_bet_bet
sta multiply_v1
lda two
sta multiply_returnnum
jmp funcbegin_multiply:
multiply_return2location: lda multiply_out
sta place_bet_bet
add two
sta place_bet_bet
jmp place_bet_type_add:
place_bet_endif_5: lda get_keypad_3
sub one
jne place_bet_endif_7:
lda place_bet_prev_press_3
sub one
jne place_bet_endif_8:
jmp place_bet_nothing_pressed:
place_bet_endif_8: lda place_bet_bet
sta multiply_v1
lda three
sta multiply_returnnum
jmp funcbegin_multiply:
multiply_return3location: lda multiply_out
sta place_bet_bet
add three
sta place_bet_bet
jmp place_bet_type_add:
place_bet_endif_7: lda get_keypad_4
sub one
jne place_bet_endif_9:
lda place_bet_prev_press_4
sub one
jne place_bet_endif_10:
jmp place_bet_nothing_pressed:
place_bet_endif_10: lda place_bet_bet
sta multiply_v1
lda four
sta multiply_returnnum
jmp funcbegin_multiply:
multiply_return4location: lda multiply_out
sta place_bet_bet
add four
sta place_bet_bet
jmp place_bet_type_add:
place_bet_endif_9: lda get_keypad_5
sub one
jne place_bet_endif_11:
lda place_bet_prev_press_5
sub one
jne place_bet_endif_12:
jmp place_bet_nothing_pressed:
place_bet_endif_12: lda place_bet_bet
sta multiply_v1
lda five
sta multiply_returnnum
jmp funcbegin_multiply:
multiply_return5location: lda multiply_out
sta place_bet_bet
add five
sta place_bet_bet
jmp place_bet_type_add:
place_bet_endif_11: lda get_keypad_6
sub one
jne place_bet_endif_13:
lda place_bet_prev_press_6
sub one
jne place_bet_endif_14:
jmp place_bet_nothing_pressed:
place_bet_endif_14: lda place_bet_bet
sta multiply_v1
lda six
sta multiply_returnnum
jmp funcbegin_multiply:
multiply_return6location: lda multiply_out
sta place_bet_bet
add six
sta place_bet_bet
jmp place_bet_type_add:
place_bet_endif_13: lda get_keypad_7
sub one
jne place_bet_endif_15:
lda place_bet_prev_press_7
sub one
jne place_bet_endif_16:
jmp place_bet_nothing_pressed:
place_bet_endif_16: lda place_bet_bet
sta multiply_v1
lda seven
sta multiply_returnnum
jmp funcbegin_multiply:
multiply_return7location: lda multiply_out
sta place_bet_bet
add seven
sta place_bet_bet
jmp place_bet_type_add:
place_bet_endif_15: lda get_keypad_8
sub one
jne place_bet_endif_17:
lda place_bet_prev_press_8
sub one
jne place_bet_endif_18:
jmp place_bet_nothing_pressed:
place_bet_endif_18: lda place_bet_bet
sta multiply_v1
lda eight
sta multiply_returnnum
jmp funcbegin_multiply:
multiply_return8location: lda multiply_out
sta place_bet_bet
add eight
sta place_bet_bet
jmp place_bet_type_add:
place_bet_endif_17: lda get_keypad_9
sub one
jne place_bet_endif_19:
lda place_bet_prev_press_9
sub one
jne place_bet_endif_20:
jmp place_bet_nothing_pressed:
place_bet_endif_20: lda place_bet_bet
sta multiply_v1
lda nine
sta multiply_returnnum
jmp funcbegin_multiply:
multiply_return9location: lda multiply_out
sta place_bet_bet
add nine
sta place_bet_bet
jmp place_bet_type_add:
place_bet_endif_19: jmp place_bet_nothing_pressed:
place_bet_type_add: lda place_bet_entered_characters
add one
sta place_bet_entered_characters
lda five
sub place_bet_entered_characters
jge place_bet_endif_21:
lda zero
sta write_nuh_uh_returnnum
jmp funcbegin_write_nuh_uh:
write_nuh_uh_return0location: jmp place_bet_start:
place_bet_endif_21: lda money
sub place_bet_bet
jge place_bet_endif_22:
lda one
sta write_nuh_uh_returnnum
jmp funcbegin_write_nuh_uh:
write_nuh_uh_return1location: jmp place_bet_start:
place_bet_endif_22: lda place_bet_bet
sta display_num_num
lda one
sta display_num_returnnum
jmp funcbegin_display_num:
display_num_return1location: sta &fef
place_bet_nothing_pressed: lda get_keypad_0
sta place_bet_prev_press_0
lda get_keypad_1
sta place_bet_prev_press_1
lda get_keypad_2
sta place_bet_prev_press_2
lda get_keypad_3
sta place_bet_prev_press_3
lda get_keypad_4
sta place_bet_prev_press_4
lda get_keypad_5
sta place_bet_prev_press_5
lda get_keypad_6
sta place_bet_prev_press_6
lda get_keypad_7
sta place_bet_prev_press_7
lda get_keypad_8
sta place_bet_prev_press_8
lda get_keypad_9
sta place_bet_prev_press_9
lda get_keypad_a
jne place_bet_endif_23:
jmp place_bet_type_loop:
place_bet_endif_23: lda place_bet_bet
sta bet
lda money
sub place_bet_bet
sta money
lda place_bet_returnnum
jne place_bet_nextret0:
jmp place_bet_return0location:
place_bet_nextret0: jmp place_bet_return1location:
funcbegin_begin_round: lda zero
sta reset_cards_returnnum
jmp funcbegin_reset_cards:
reset_cards_return0location: lda zero
sta begin_round_dealer_value
lda zero
sta begin_round_player_value
lda zero
sta print_dealers_turn_returnnum
jmp funcbegin_print_dealers_turn:
print_dealers_turn_return0location: lda zero
sta dealer_play_returnnum
jmp funcbegin_dealer_play:
dealer_play_return0location: lda zero
sta print_your_turn_returnnum
jmp funcbegin_print_your_turn:
print_your_turn_return0location: sta &fef
begin_round_hit: lda zero
sta write_you_returnnum
jmp funcbegin_write_you:
write_you_return0location: lda oneeight
sta wait_returnnum
jmp funcbegin_wait:
wait_return18location: lda one
sta write_got_returnnum
jmp funcbegin_write_got:
write_got_return1location: lda onenine
sta wait_returnnum
jmp funcbegin_wait:
wait_return19location: lda one
sta draw_card_returnnum
jmp funcbegin_draw_card:
draw_card_return1location: lda draw_card_card
sta print_card_card
lda one
sta print_card_returnnum
jmp funcbegin_print_card:
print_card_return1location: lda begin_round_player_value
add print_card_value
sta begin_round_player_value
lda twozero
sta wait_returnnum
jmp funcbegin_wait:
wait_return20location: lda twoone
sta wait_returnnum
jmp funcbegin_wait:
wait_return21location: lda twoone
sub begin_round_player_value
jge begin_round_endif_0:
lda zero
sta write_bust_returnnum
jmp funcbegin_write_bust:
write_bust_return0location: lda twotwo
sta wait_returnnum
jmp funcbegin_wait:
wait_return22location: lda twothree
sta wait_returnnum
jmp funcbegin_wait:
wait_return23location: jmp begin_round_end:
begin_round_endif_0: lda zero
sta write_hit_returnnum
jmp funcbegin_write_hit:
write_hit_return0location: lda twofour
sta wait_returnnum
jmp funcbegin_wait:
wait_return24location: lda zero
sta write_or_returnnum
jmp funcbegin_write_or:
write_or_return0location: lda twofive
sta wait_returnnum
jmp funcbegin_wait:
wait_return25location: lda zero
sta write_stand_returnnum
jmp funcbegin_write_stand:
write_stand_return0location: sta &fef
begin_round_wait_input: lda one
sta get_keypad_returnnum
jmp funcbegin_get_keypad:
get_keypad_return1location: lda get_keypad_f
sub one
jne begin_round_endif_1:
jmp begin_round_hit:
begin_round_endif_1: lda get_keypad_e
sub one
jne begin_round_endif_2:
jmp begin_round_dealer_turn:
begin_round_endif_2: jmp begin_round_wait_input:
begin_round_dealer_turn: lda one
sta print_dealers_turn_returnnum
jmp funcbegin_print_dealers_turn:
print_dealers_turn_return1location: sta &fef
begin_round_dealer_hit: lda one
sta dealer_play_returnnum
jmp funcbegin_dealer_play:
dealer_play_return1location: lda begin_round_dealer_value
sub oneeight
jge begin_round_endif_3:
lda one
sta write_hit_returnnum
jmp funcbegin_write_hit:
write_hit_return1location: lda twosix
sta wait_returnnum
jmp funcbegin_wait:
wait_return26location: lda twoseven
sta wait_returnnum
jmp funcbegin_wait:
wait_return27location: jmp begin_round_dealer_hit:
begin_round_endif_3: lda twoone
sub begin_round_dealer_value
jge begin_round_endif_4:
lda two
sta write_dealer_returnnum
jmp funcbegin_write_dealer:
write_dealer_return2location: lda twoeight
sta wait_returnnum
jmp funcbegin_wait:
wait_return28location: lda one
sta write_bust_returnnum
jmp funcbegin_write_bust:
write_bust_return1location: lda twonine
sta wait_returnnum
jmp funcbegin_wait:
wait_return29location: lda threezero
sta wait_returnnum
jmp funcbegin_wait:
wait_return30location: lda one
sta write_you_returnnum
jmp funcbegin_write_you:
write_you_return1location: lda threeone
sta wait_returnnum
jmp funcbegin_wait:
wait_return31location: lda zero
sta write_win_returnnum
jmp funcbegin_write_win:
write_win_return0location: lda money
add place_bet_bet
add place_bet_bet
sta money
jmp begin_round_end:
begin_round_endif_4: lda two
sta write_you_returnnum
jmp funcbegin_write_you:
write_you_return2location: lda threetwo
sta wait_returnnum
jmp funcbegin_wait:
wait_return32location: lda begin_round_player_value
sub begin_round_dealer_value
jge begin_round_endif_5:
lda zero
sta write_lose_returnnum
jmp funcbegin_write_lose:
write_lose_return0location: jmp begin_round_end:
begin_round_endif_5: lda one
sta write_win_returnnum
jmp funcbegin_write_win:
write_win_return1location: sta &fef
begin_round_end: lda threethree
sta wait_returnnum
jmp funcbegin_wait:
wait_return33location: lda threefour
sta wait_returnnum
jmp funcbegin_wait:
wait_return34location: lda begin_round_returnnum
jne begin_round_nextret0:
jmp begin_round_return0location:
begin_round_nextret0: jmp begin_round_return1location:
funcbegin_write_money_value: lda money
sta display_num_num
lda zero
sta display_num_returnnum
jmp funcbegin_display_num:
display_num_return0location: jmp write_money_value_return0location:
zero_char defw &0c3f
one_char defw &0406
two_char defw &00db
three_char defw &00cf
four_char defw &00e6
five_char defw &00ed
six_char defw &00fd
seven_char defw &0c01
eight_char defw &00ff
nine_char defw &00ef
char_a defw &00f7
char_b defw &128f
char_c defw &0039
char_d defw &120f
char_e defw &00f9
char_f defw &00f1
char_g defw &00bd
char_h defw &00f6
char_i defw &1209
char_j defw &001e
char_k defw &2470
char_l defw &0038
char_m defw &0536
char_n defw &2136
char_o defw &003f
char_p defw &00f3
char_q defw &203f
char_r defw &20f3
char_s defw &018d
char_t defw &1201
char_u defw &003e
char_v defw &0c30
char_w defw &2836
char_x defw &2d00
char_y defw &1500
char_z defw &0c09
char_ques defw &1083
char_exclam defw &4006
randseed1 defw &02a4
randseed2 defw &1068
wait_start_count defw &0000
wait_start_loop_pause defw &0000
money defw &0064
bet defw &0000
1_sec_beep defw &8a40
print_controls_returnnum defw &0000
print_a_control_returnnum defw &0000
print_a_control_maxProgress defw &0000
print_a_control_progress defw &0000
print_a_control_char0 defw &0000
print_a_control_char1 defw &0000
print_a_control_char2 defw &0000
print_a_control_char3 defw &0000
print_a_control_char4 defw &0000
print_a_control_char5 defw &0000
print_a_control_length defw &0010
print_a_control_c_0 defw &00f7
print_a_control_c_1 defw &0000
print_a_control_c_2 defw &1201
print_a_control_c_3 defw &003f
print_a_control_c_4 defw &0000
print_a_control_c_5 defw &0039
print_a_control_c_6 defw &003f
print_a_control_c_7 defw &2136
print_a_control_c_8 defw &00f1
print_a_control_c_9 defw &1209
print_a_control_c_10 defw &20f3
print_a_control_c_11 defw &0536
print_a_control_c_12 defw &0000
print_a_control_c_13 defw &128f
print_a_control_c_14 defw &00f9
print_a_control_c_15 defw &1201
print_e_control_returnnum defw &0000
print_e_control_maxProgress defw &0000
print_e_control_progress defw &0000
print_e_control_char0 defw &0000
print_e_control_char1 defw &0000
print_e_control_char2 defw &0000
print_e_control_char3 defw &0000
print_e_control_char4 defw &0000
print_e_control_char5 defw &0000
print_e_control_length defw &000a
print_e_control_c_0 defw &00f9
print_e_control_c_1 defw &0000
print_e_control_c_2 defw &1201
print_e_control_c_3 defw &003f
print_e_control_c_4 defw &0000
print_e_control_c_5 defw &018d
print_e_control_c_6 defw &1201
print_e_control_c_7 defw &00f7
print_e_control_c_8 defw &2136
print_e_control_c_9 defw &120f
print_f_control_returnnum defw &0000
print_f_control_maxProgress defw &0000
print_f_control_progress defw &0000
print_f_control_char0 defw &0000
print_f_control_char1 defw &0000
print_f_control_char2 defw &0000
print_f_control_char3 defw &0000
print_f_control_char4 defw &0000
print_f_control_char5 defw &0000
print_f_control_length defw &0008
print_f_control_c_0 defw &00f1
print_f_control_c_1 defw &0000
print_f_control_c_2 defw &1201
print_f_control_c_3 defw &003f
print_f_control_c_4 defw &0000
print_f_control_c_5 defw &00f6
print_f_control_c_6 defw &1209
print_f_control_c_7 defw &1201
print_b_control_returnnum defw &0000
print_b_control_maxProgress defw &0000
print_b_control_progress defw &0000
print_b_control_char0 defw &0000
print_b_control_char1 defw &0000
print_b_control_char2 defw &0000
print_b_control_char3 defw &0000
print_b_control_char4 defw &0000
print_b_control_char5 defw &0000
print_b_control_length defw &000e
print_b_control_c_0 defw &128f
print_b_control_c_1 defw &0000
print_b_control_c_2 defw &1201
print_b_control_c_3 defw &003f
print_b_control_c_4 defw &0000
print_b_control_c_5 defw &00f3
print_b_control_c_6 defw &0038
print_b_control_c_7 defw &00f7
print_b_control_c_8 defw &0039
print_b_control_c_9 defw &00f9
print_b_control_c_10 defw &0000
print_b_control_c_11 defw &128f
print_b_control_c_12 defw &00f9
print_b_control_c_13 defw &1201
write_money_value_returnnum defw &0000
write_nuh_uh_returnnum defw &0000
write_dealer_returnnum defw &0000
write_got_returnnum defw &0000
write_you_returnnum defw &0000
write_money_text_returnnum defw &0000
write_hit_returnnum defw &0000
write_or_returnnum defw &0000
write_stand_returnnum defw &0000
print_c_for_controls_returnnum defw &0000
print_c_for_controls_maxProgress defw &0000
print_c_for_controls_progress defw &0000
print_c_for_controls_char0 defw &0000
print_c_for_controls_char1 defw &0000
print_c_for_controls_char2 defw &0000
print_c_for_controls_char3 defw &0000
print_c_for_controls_char4 defw &0000
print_c_for_controls_char5 defw &0000
print_c_for_controls_length defw &0015
print_c_for_controls_c_0 defw &00f3
print_c_for_controls_c_1 defw &20f3
print_c_for_controls_c_2 defw &00f9
print_c_for_controls_c_3 defw &018d
print_c_for_controls_c_4 defw &018d
print_c_for_controls_c_5 defw &0000
print_c_for_controls_c_6 defw &0039
print_c_for_controls_c_7 defw &0000
print_c_for_controls_c_8 defw &00f1
print_c_for_controls_c_9 defw &003f
print_c_for_controls_c_10 defw &20f3
print_c_for_controls_c_11 defw &0000
print_c_for_controls_c_12 defw &0039
print_c_for_controls_c_13 defw &003f
print_c_for_controls_c_14 defw &2136
print_c_for_controls_c_15 defw &1201
print_c_for_controls_c_16 defw &20f3
print_c_for_controls_c_17 defw &003f
print_c_for_controls_c_18 defw &0038
print_c_for_controls_c_19 defw &0038
print_c_for_controls_c_20 defw &018d
print_dealers_turn_returnnum defw &0000
print_your_turn_returnnum defw &0000
write_your_returnnum defw &0000
write_turn_returnnum defw &0000
print_welcome_returnnum defw &0000
print_welcome_maxProgress defw &0000
print_welcome_progress defw &0000
print_welcome_char0 defw &0000
print_welcome_char1 defw &0000
print_welcome_char2 defw &0000
print_welcome_char3 defw &0000
print_welcome_char4 defw &0000
print_welcome_char5 defw &0000
print_welcome_length defw &001a
print_welcome_c_0 defw &2836
print_welcome_c_1 defw &00f9
print_welcome_c_2 defw &0038
print_welcome_c_3 defw &0039
print_welcome_c_4 defw &003f
print_welcome_c_5 defw &0536
print_welcome_c_6 defw &00f9
print_welcome_c_7 defw &4006
print_welcome_c_8 defw &0000
print_welcome_c_9 defw &00f3
print_welcome_c_10 defw &20f3
print_welcome_c_11 defw &00f9
print_welcome_c_12 defw &018d
print_welcome_c_13 defw &018d
print_welcome_c_14 defw &0000
print_welcome_c_15 defw &0c3f
print_welcome_c_16 defw &0000
print_welcome_c_17 defw &1201
print_welcome_c_18 defw &003f
print_welcome_c_19 defw &0000
print_welcome_c_20 defw &128f
print_welcome_c_21 defw &00f9
print_welcome_c_22 defw &00bd
print_welcome_c_23 defw &1209
print_welcome_c_24 defw &2136
print_welcome_c_25 defw &4006
halve_returnnum defw &0000
halve_num defw &0000
halve_out defw &0000
halve_count defw &0000
get_keypad_returnnum defw &0000
get_keypad_copy defw &0000
get_keypad_0 defw &0000
get_keypad_1 defw &0000
get_keypad_2 defw &0000
get_keypad_3 defw &0000
get_keypad_4 defw &0000
get_keypad_5 defw &0000
get_keypad_6 defw &0000
get_keypad_7 defw &0000
get_keypad_8 defw &0000
get_keypad_9 defw &0000
get_keypad_a defw &0000
get_keypad_b defw &0000
get_keypad_c defw &0000
get_keypad_d defw &0000
get_keypad_e defw &0000
get_keypad_f defw &0000
time1sec_returnnum defw &0000
time1sec_count defw &0000
time1sec_count2 defw &0000
time1sec_count3 defw &0000
wait_returnnum defw &0000
wait_30k defw &0000
wait_30k2 defw &0000
wait_out_out_loop defw &0000
wait_out_loop defw &0000
wait_in_loop defw &0000
wait_half_init_returnnum defw &0000
wait_half_init_out_out_loop defw &0000
wait_half_init_out_loop defw &0000
wait_half_init_in_loop defw &0000
wait_half_returnnum defw &0000
wait_half_30k defw &0000
wait_half_30k2 defw &0000
wait_half_out_out_loop defw &0000
wait_half_out_loop defw &0000
wait_half_in_loop defw &0000
digit_returnnum defw &0000
digit_num defw &0000
digit_out defw &0000
display_num_returnnum defw &0000
display_num_num defw &0000
display_num_copy defw &0000
display_num_10ks defw &0000
display_num_1ks defw &0000
display_num_hs defw &0000
display_num_ts defw &0000
display_num_10kprinted defw &0000
display_num_1kprinted defw &0000
display_num_hprinted defw &0000
random_returnnum defw &0000
random_max defw &0000
random_out defw &0000
multiply_returnnum defw &0000
multiply_v1 defw &0000
multiply_v2 defw &0000
multiply_v2_copy defw &0000
multiply_out defw &0000
write_enter_returnnum defw &0000
write_num_returnnum defw &0000
place_bet_returnnum defw &0000
place_bet_entered_characters defw &0000
place_bet_bet defw &0000
place_bet_prev_press_0 defw &0000
place_bet_prev_press_1 defw &0000
place_bet_prev_press_2 defw &0000
place_bet_prev_press_3 defw &0000
place_bet_prev_press_4 defw &0000
place_bet_prev_press_5 defw &0000
place_bet_prev_press_6 defw &0000
place_bet_prev_press_7 defw &0000
place_bet_prev_press_8 defw &0000
place_bet_prev_press_9 defw &0000
reset_cards_returnnum defw &0000
draw_card_returnnum defw &0000
draw_card_0 defw &0000
draw_card_1 defw &0000
draw_card_2 defw &0000
draw_card_3 defw &0000
draw_card_4 defw &0000
draw_card_5 defw &0000
draw_card_6 defw &0000
draw_card_7 defw &0000
draw_card_8 defw &0000
draw_card_9 defw &0000
draw_card_10 defw &0000
draw_card_11 defw &0000
draw_card_12 defw &0000
draw_card_13 defw &0000
draw_card_14 defw &0000
draw_card_15 defw &0000
draw_card_16 defw &0000
draw_card_17 defw &0000
draw_card_18 defw &0000
draw_card_19 defw &0000
draw_card_20 defw &0000
draw_card_21 defw &0000
draw_card_22 defw &0000
draw_card_23 defw &0000
draw_card_24 defw &0000
draw_card_25 defw &0000
draw_card_26 defw &0000
draw_card_27 defw &0000
draw_card_28 defw &0000
draw_card_29 defw &0000
draw_card_30 defw &0000
draw_card_31 defw &0000
draw_card_32 defw &0000
draw_card_33 defw &0000
draw_card_34 defw &0000
draw_card_35 defw &0000
draw_card_36 defw &0000
draw_card_37 defw &0000
draw_card_38 defw &0000
draw_card_39 defw &0000
draw_card_40 defw &0000
draw_card_41 defw &0000
draw_card_42 defw &0000
draw_card_43 defw &0000
draw_card_44 defw &0000
draw_card_45 defw &0000
draw_card_46 defw &0000
draw_card_47 defw &0000
draw_card_48 defw &0000
draw_card_49 defw &0000
draw_card_50 defw &0000
draw_card_51 defw &0000
draw_card_cards_available defw &0034
draw_card_rand defw &0000
draw_card_card defw &0000
write_spades_returnnum defw &0000
write_hearts_returnnum defw &0000
write_dias_returnnum defw &0000
write_clubs_returnnum defw &0000
write_of_returnnum defw &0000
write_jack_returnnum defw &0000
write_queen_returnnum defw &0000
write_king_returnnum defw &0000
write_ace_returnnum defw &0000
write_bust_returnnum defw &0000
write_win_returnnum defw &0000
write_lose_returnnum defw &0000
print_card_returnnum defw &0000
print_card_card defw &0000
print_card_value defw &0000
print_card_suit defw &0000
dealer_play_returnnum defw &0000
begin_round_returnnum defw &0000
begin_round_dealer_value defw &0000
begin_round_player_value defw &0000
zero defw &0000
one defw &0001
two defw &0002
three defw &0003
four defw &0004
five defw &0005
six defw &0006
seven defw &0007
eight defw &0008
nine defw &0009
onezero defw &000a
oneone defw &000b
onetwo defw &000c
onethree defw &000d
onefour defw &000e
onefive defw &000f
onesix defw &0010
oneseven defw &0011
oneeight defw &0012
onenine defw &0013
twozero defw &0014
twoone defw &0015
twotwo defw &0016
twothree defw &0017
twofour defw &0018
twofive defw &0019
twosix defw &001a
twoseven defw &001b
twoeight defw &001c
twonine defw &001d
threezero defw &001e
threeone defw &001f
threetwo defw &0020
threethree defw &0021
threefour defw &0022
threefive defw &0023
threesix defw &0024
threeseven defw &0025
threeeight defw &0026
threenine defw &0027
fourzero defw &0028
fourone defw &0029
fourtwo defw &002a
fourthree defw &002b
fourfour defw &002c
fourfive defw &002d
foursix defw &002e
fourseven defw &002f
foureight defw &0030
fournine defw &0031
fivezero defw &0032
fiveone defw &0033
fivetwo defw &0034
fivesix defw &0038
fiveseven defw &0039
sixthree defw &003f
sixfour defw &0040
ninenine defw &0063
onezerozero defw &0064
onetwoeight defw &0080
oneeightnine defw &00bd
twofourone defw &00f1
twofourthree defw &00f3
twofoursix defw &00f6
twofourseven defw &00f7
twofournine defw &00f9
twofivesix defw &0100
threenineseven defw &018d
fiveonetwo defw &0200
nineninenine defw &03e7
onezerozerozero defw &03e8
onezerotwofour defw &0400
onethreethreefour defw &0536
twozerofoureight defw &0800
threeonethreefive defw &0c3f
fourzeroninesix defw &1000
foursixzeronine defw &1201
foursixoneseven defw &1209
foursixtwothree defw &120f
foursevenfiveone defw &128f
eightoneninetwo defw &2000
eightfourthreefive defw &20f3
eightfivezerotwo defw &2136
ninenineninenine defw &270f
onezerozerozerozero defw &2710
onezerotwoninefour defw &2836
onesixthreeeightfour defw &4000
onesixthreeninezero defw &4006
threezerozerozerozero defw &7530
threetwosevensixeight defw &8000