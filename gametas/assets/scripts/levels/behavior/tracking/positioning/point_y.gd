extends Node

class_name Point_Y

var velocity: Vector2

func apply(next, speed):
	velocity = next
	velocity.y += speed

func check(finish):
	return velocity.y == finish

func move(actor, speed):
	actor.move_vertical(speed)
