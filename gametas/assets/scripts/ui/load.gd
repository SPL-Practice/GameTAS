extends Control

func _ready():
	open_scene()

func open_scene():
	$AnimationPlayer.play("open_scene")
	
func close_scene():
	$AnimationPlayer.play_backwards("open_scene")
