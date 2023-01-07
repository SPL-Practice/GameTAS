extends KinematicBody2D

var velocity = Vector2()

export (Vector2) var speed = Vector2(500, 500)
var maxed = Vector2(45000, 22500)
var current = Vector2(0, 0)
var state = 1

onready var animation = $animation
onready var health = $health
onready var power = $power
	
func kill():
	queue_free()
	get_tree().change_scene("res://assets/scenes/menu/authors/ending/bad.tscn")
			
func _physics_process(delta):
	velocity.x = 0
	velocity.y = 0
	
	if state == 1:
		velocity.x += speed.x
		current.x += speed.x
		if current.x >= maxed.x:
			speed.x *= -1
			state = 2
	elif state == 2:
		velocity.y += speed.y
		current.y += speed.y
		if current.y >= maxed.y:
			speed.y *= -1
			state = 3
	elif state == 3:
		if current.y >= 0:
			velocity.y += speed.y
			current.y += speed.y
		if current.x >= 0:	
			velocity.x += speed.x
			current.x += speed.x
		else:
			speed.x *= -1
			speed.y *= -1
			state = 4
	elif state == 4:
		velocity.y += speed.y
		current.y += speed.y
		if current.y >= maxed.y:
			speed.y *= -1
			state = 5
	elif state == 5:
		velocity.x += speed.x
		current.x += speed.x
		if current.x >= maxed.x:
			speed.x *= -1
			state = 6
	elif state == 6:
		if current.y >= 0:
			velocity.y += speed.y
			current.y += speed.y
		if current.x >= 0:	
			velocity.x += speed.x
			current.x += speed.x
		else:
			speed.x *= -1
			speed.y *= -1
			state = 1
	
	move_and_slide(velocity)


func _on_slug_body_entered(body):
	body.health.hold_damage(power.value)

func _on_slug_body_exited(body):
	body.health.release_damage(power.value)
