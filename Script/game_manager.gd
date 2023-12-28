extends Node

var level_of_dfficulty : int = 1
@export var failed_parcent : Array = [5.0, 1.0, 0.25]

func get_failed_parcent():
	return failed_parcent[level_of_dfficulty]

var is_tempo_timer : bool = true
var is_shar_play : bool = true

enum PNUM
{
	P1,
	P2,
	NPC
}

#プレイヤーが何か識別する
var player_identification : Array[PNUM] = [PNUM.P1, PNUM.P2]
var vs_string = "Player2"

func vs_npc():
	player_identification[1] = PNUM.NPC
	vs_string = "NPC"
func vs_p2():
	player_identification[1] = PNUM.P2
	vs_string = "Player2"
	
var turn : bool = true
var is_game_set = false

var command_memory : Array[int] = []
var push_num : int = 0

func get_turn_num()->int:
	if turn:
		return 0
	else:
		return 1

func change_turn():
	turn = not turn
	push_num = 0

func is_new_command()->bool:
	return command_memory.size() == push_num

func identification(push : int):
	var is_success = true
	if is_new_command():
		command_memory.push_back(push)
		change_turn()
		is_control = false
	else:
		if command_memory[push_num] == push:
			push_num += 1
		else:
			is_success = false
	return is_success

var is_control : bool = true
