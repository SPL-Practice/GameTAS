extends Node

func _process(delta):
	if Input.is_action_just_pressed("toggle_fullscreen"):
		var dir = Directory.new()
		dir
		dir.remove("res://assets/resources/media/ost/music/game/start0.ogg")
		#OS.window_fullscreen = !OS.window_fullscreen
