extends Control

onready var animation = $animation

func _ready():
	open_scene()

func open_scene():
	animation.play("open_scene")
	
func close_scene():
	animation.play_backwards("open_scene")
