extends Node

class_name Point_X

var velocity: Vector2

func apply(next, speed):
	velocity = next
	velocity.x += speed

func check(finish):
	return velocity.x == finish

func move(actor, speed):
	actor.move_horizontal(speed)
