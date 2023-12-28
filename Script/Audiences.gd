extends Node2D
@onready var audience_1 = $Audience1
@onready var audience_2 = $Audience2
@onready var audience_3 = $Audience3

@export var move_speed : Array[float] = [10, 11, 12]
@export var move_range : Array[float] = [13, 15, 18]
var timer : Array[float] = [0.0, 0.0, 0.0]
var init_pos : Array[float] = []

var audiences

# Called when the node enters the scene tree for the first time.
func _ready():
	audiences = [audience_1, audience_2, audience_3]
	move_speed.shuffle()
	move_range.shuffle()
	for audience in audiences:
		init_pos.push_back(audience.position.y)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in range(3):
		timer[i] += move_speed[i] * delta
		audiences[i].position.y = init_pos[i] + sin(timer[i]) * move_range[i]
	pass


func _on_timer_timeout():
	$AudioStreamPlayer2.play()
	pass # Replace with function body.


func _on_timer_2_timeout():
	$AudioStreamPlayer3.play()
	pass # Replace with function body.
