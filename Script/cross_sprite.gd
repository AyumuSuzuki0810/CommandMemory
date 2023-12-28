extends Path2D

@onready var mark_arrow = $PathFollow2D/MarkArrow
@onready var path_follow_2d = $PathFollow2D
@onready var audio_stream_player = $AudioStreamPlayer

var path_num : int = 0
var is_missing = false

var path_res = [
	[load("res://path/up_path.tres"), load("res://Textures/mark_arrow_up.png"), load("res://Audio/001_ずんだもん（ノーマル）_ヴァーーー.wav")],
	[load("res://path/down_path.tres"), load("res://Textures/mark_arrow_down.png"), load("res://Audio/002_ずんだもん（ノーマル）_ブーーー.wav")],
	[load("res://path/right_path.tres"), load("res://Textures/mark_arrow_right.png"), load("res://Audio/003_ずんだもん（ノーマル）_ヴェーー.wav")],
	[load("res://path/left_path.tres"), load("res://Textures/mark_arrow_left.png"), load("res://Audio/004_ずんだもん（ノーマル）_ヴォーーー.wav")],
	[load("res://path/miss_path.tres"), load("res://Textures/miss.png"), load("res://Audio/005_ずんだもん（ノーマル）_あっ.wav")]
]

var move_speed : float = 2.0

# Called when the node enters the scene tree for the first time.
func _ready():
	var paths = path_res[path_num]
	if is_missing:
		paths = path_res[4]
	curve = paths[0]
	mark_arrow.texture = paths[1]		
	audio_stream_player.stream = paths[2]
	audio_stream_player.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	path_follow_2d.progress_ratio += move_speed * delta
	if path_follow_2d.progress_ratio == 1.0:
		queue_free()
	pass
