extends Node2D

@export var player_number : int = 0
var pnum = GameManager.PNUM

@onready var animation_player = $AnimationPlayer
@onready var animation_tree = $AnimationTree
var is_success : bool = true

var input_key_velo : Vector2 = Vector2.ZERO

var key_num : Dictionary
var key_str = ["_Up", "_Down", "_Right", "_Left"]
var val_arr = [
	[Vector2(0.0, 1.0), 0],
	[Vector2(0.0, -1.0), 1],
	[Vector2(1.0, 0.0), 2],
	[Vector2(-1.0, 0.0), 3]
	]

func get_state()->AnimationNodeStateMachinePlayback:
	return animation_tree.get("parameters/playback")

func travel(t_str : String):
	get_state().travel(t_str)
	
func get_anime():
	return get_state().get_current_node()


# Called when the node enters the scene tree for the first time.
func _ready():
	$MoveBackTimer.wait_time = TempoTimer.wait_time
	pnum = GameManager.player_identification[player_number]
	var gm_pnum = GameManager.PNUM
	var p_str : String
	if pnum != gm_pnum.NPC:
		match pnum:
			gm_pnum.P1:
				p_str = "1P"
			gm_pnum.P2:
				p_str = "2P"
		if GameManager.is_shar_play:
			p_str = "1P"
		key_num = {
			p_str + key_str[0] : val_arr[0],
			p_str + key_str[1] : val_arr[1],
			p_str + key_str[2] : val_arr[2],
			p_str + key_str[3] : val_arr[3]
		}
	
	
	animation_tree.active = true
	travel("Move")
	pass # Replace with function body.

func is_my_turn()->bool:
	return player_number == GameManager.get_turn_num()
	
func is_npc():
	return pnum == GameManager.PNUM.NPC

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if is_my_turn() and not GameManager.is_game_set and GameManager.is_control:
		if is_npc():
			pass
		else:
			player_action()
	pass

var push_memory : int = 0
var one_wait : bool = false#Moveに戻る前に一拍おくフラグ

var CROSS_SPRITE = preload("res://tscn/Other/cross_sprite.tscn")
func loadArrow(key : int):
	var cs = CROSS_SPRITE.instantiate()
	cs.path_num = key
	cs.is_missing = not is_success
	add_child(cs)

func player_action():
	for key in key_num:
		if Input.is_action_just_pressed(key):
			var value = key_num[key]
			input_key_velo = value[0]
			push_memory = value[1]
			
			animation_process()
			
			loadArrow(value[1])
			
	if not is_my_turn():#自身のターンが終了した瞬間に一拍置くようにする
			one_wait = true

var failed_parcent : float = GameManager.get_failed_parcent()
func npc_action():
	var success_parcent = 100.0 - failed_parcent * GameManager.push_num
	var parcent = randf_range(0, 100)
	var key : int = 0
	if success_parcent >= parcent and not GameManager.is_new_command():
		key = GameManager.command_memory[GameManager.push_num]
	else:
		key = randi() % 4
	var value = val_arr[key]
	input_key_velo = value[0]
	push_memory = value[1]
		
	animation_process()
	
	loadArrow(value[1])
	
	if not is_my_turn():#自身のターンが終了した瞬間に一拍置くようにする
		one_wait = true
	
func animation_process():
	is_success = GameManager.identification(push_memory)

	if is_success:
		animation_tree.set("parameters/Success/blend_position", input_key_velo)
		travel("Success")
	else:
		animation_tree.set("parameters/Failed/blend_position", input_key_velo)
		travel("Failed")
		GameManager.is_game_set = true
		
var wait_count = 0
func _on_move_back_timer_timeout():
	if not is_my_turn() or GameManager.push_num == 0:
		if is_success:
			if one_wait:#一拍置く場合は
				if wait_count == 1:#一拍置いたか判定してからMoveに戻る
					travel("Move")
					one_wait = false
					wait_count = 0
					GameManager.is_control = true
				else:#おいてない場合はおく
					wait_count += 1
			else:
				travel("Move")
	
	if is_my_turn() and is_success and is_npc() and GameManager.is_control:
		npc_action()
		pass
	pass # Replace with function body.
