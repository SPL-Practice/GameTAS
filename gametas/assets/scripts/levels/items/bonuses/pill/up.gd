extends Area2D

var buff = 1

func _on_pill_body_entered(body):
	body.health.max_health += buff
	queue_free()
