extends ColorRect

onready var player = $player

func _ready():
	yield(get_tree().create_timer(1), "timeout")
	player.play("logo")
	yield(get_tree().create_timer(3), "timeout")
	player.play_backwards("logo")
	yield(get_tree().create_timer(1), "timeout")
	print_debug(get_tree().change_scene("res://assets/scenes/menu/main.tscn"))
