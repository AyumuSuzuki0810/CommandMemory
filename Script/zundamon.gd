extends Node2D

@export var player_number : int = 0
var pnum = GameManager.PNUM

@onready var animation_player = $AnimationPlayer
@onready var animation_tree = $AnimationTree


# Called when the node enters the scene tree for the first time.
func _ready():
	pnum = GameManager.player_identification[player_number]
	animation_tree.active = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
