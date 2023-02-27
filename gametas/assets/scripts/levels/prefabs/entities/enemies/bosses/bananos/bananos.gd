extends "res://assets/scripts/levels/prefabs/entities/enemies/bosses/self/self.gd"

onready var power = $stats/power

func _on_slug_body_entered(body):
	body.health.hold_damage(power.value)

func _on_slug_body_exited(body):
	body.health.release_damage(power.value)
