extends KinematicBody2D

onready var health = $health
onready var power = $power
onready var speed = $speed
onready var animation = $animation

func _ready():
	health.connect("killed", self, "kill")

func damage(amount):
	animation.play("damage")
	health.value -= amount
	
func kill():
	queue_free()

func _on_slug_body_entered(body):
	body.health.hold_damage(power.value)

func _on_slug_body_exited(body):
	body.health.release_damage(power.value)
