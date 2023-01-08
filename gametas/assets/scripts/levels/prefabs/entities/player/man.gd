extends "res://assets/scripts/levels/prefabs/entities/player/noman.gd"

onready var health = $health
onready var power = $power
onready var weapon = $weapon
onready var torso = $shape
onready var animation = $shape/ailments

func _heal():
	animation.play("heal")
	
func _damage():
	animation.play("damage")

func move():
	var velocity = .move()
	weapon.move(velocity)
	return velocity

func _kill():
	queue_free()
	get_tree().change_scene("res://assets/scenes/menu/authors/logo.tscn")
