extends KinematicBody2D

signal trophy(position)

onready var health = $stats/health
onready var power = $stats/power
onready var speed = $stats/speed
onready var animation = $ailments

func _damage():
	animation.play("damage")

func _kill():
	emit_signal("trophy", position)
	queue_free()

func _on_slug_body_entered(body):
	body.health.hold_damage(power.value)

func _on_slug_body_exited(body):
	body.health.release_damage(power.value)
