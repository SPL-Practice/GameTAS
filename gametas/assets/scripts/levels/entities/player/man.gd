extends "res://assets/scripts/levels/entities/player/noman.gd"

onready var health = $health
onready var power = $power
onready var weapon = $weapon
onready var torso = $shape
	
func _ready():
	health.connect("killed", self, "kill")
	
func move():
	var velocity = .move()
	weapon.move(velocity)
	return velocity

func kill():
	queue_free()
	get_tree().change_scene("res://assets/scenes/menu/logo.tscn")
