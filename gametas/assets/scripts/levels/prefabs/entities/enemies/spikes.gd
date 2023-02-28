extends Area2D

var damage = 5

func _on_spikes_body_entered(body):
	body.health.hold_damage(damage)

func _on_spikes_body_exited(body):
	body.health.release_damage(damage)
