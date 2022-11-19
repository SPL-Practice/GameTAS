extends StaticBody2D

func _on_detector_body_entered(body):
	body.damage(5)
