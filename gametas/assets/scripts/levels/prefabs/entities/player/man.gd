extends "res://assets/scripts/levels/prefabs/entities/player/noman.gd"

onready var health = $stats/health
onready var power = $stats/power
onready var weapon = $weapon
onready var torso = $shape
onready var animation = $shape/ailments

func _heal():
	animation.play("heal")
	
func _damage():
	animation.play("damage")

func _kill():
	queue_free()
	print_debug(get_tree().change_scene("res://assets/scenes/menu/authors/logo.tscn"))
