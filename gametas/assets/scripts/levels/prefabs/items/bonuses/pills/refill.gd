extends Area2D

export var sanity = 5

func _on_pill_body_entered(body):
	body.health.heal(sanity)
	queue_free()
