extends Area2D

export var buff = 1

func _on_pill_body_entered(body):
	body.health.up(buff)
	queue_free()
