extends Control

@export var first_foucs : Control

@onready var now_lod = $OptionAndHowToPlay/Option/NowLOD
var now_lod_text = "現在の難易度："
func change_lod(num : int):
	var lod : String
	match num:
		0:
			lod = "Easy"
		1:
			lod = "Normal"
		2:
			lod = "Hard"
	now_lod.text = now_lod_text + lod
	GameManager.level_of_dfficulty = num
	
@onready var check_button = $OptionAndHowToPlay/Option/LevelOfDifficulty2/VBoxContainer/CheckButton
@onready var shar_button = $OptionAndHowToPlay/Option/LevelOfDifficulty2/VBoxContainer/SharButton

# Called when the node enters the scene tree for the first time.
func _ready():
	change_lod(GameManager.level_of_dfficulty)
	check_button.button_pressed = GameManager.is_tempo_timer
	shar_button.button_pressed = GameManager.is_shar_play
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_easy_pressed():
	change_lod(0)
	pass # Replace with function body.


func _on_normal_pressed():
	change_lod(1)
	pass # Replace with function body.


func _on_hard_pressed():
	change_lod(2)
	pass # Replace with function body.


func _on_check_button_toggled(button_pressed):
	GameManager.is_tempo_timer = button_pressed
	pass # Replace with function body.


@export var menu : Control
@export var title : Control
@export var first_foucs_2 : Control

func _on_back_button_pressed():
	menu.visible = true
	title.visible = true
	visible = false
	first_foucs_2.grab_focus()
	pass # Replace with function body.


func _on_shar_button_toggled(button_pressed):
	GameManager.is_shar_play = button_pressed
	pass # Replace with function body.
