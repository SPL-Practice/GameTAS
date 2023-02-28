extends Control

onready var player = $player

func _ready():
	yield(get_tree().create_timer(1), "timeout")
	player.play("end")

func _on_menu_pressed():
	print_debug(get_tree().change_scene("res://assets/scenes/menu/authors/logo.tscn"))
