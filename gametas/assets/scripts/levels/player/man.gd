extends KinematicBody2D

var velocity = Vector2()

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		velocity.x = -60
	elif Input.is_action_pressed("ui_right"):
		velocity.x = 60
	elif Input.is_action_pressed("ui_up"):
		velocity.y = -60
	elif Input.is_action_pressed("ui_down"):
		velocity.y = 60
	else:
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide(velocity)


	
func _on_pill_body_entered(body):
	pass
