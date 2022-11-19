extends Area2D

var sanity_buff = 1

func _on_pill_body_entered(body):
	body.sanity_up(sanity_buff)
	queue_free()
