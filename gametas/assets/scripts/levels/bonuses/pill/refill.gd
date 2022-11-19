extends Area2D

var sanity = 10

func _on_pill_body_entered(body):
	body.heal(sanity)
	queue_free()
