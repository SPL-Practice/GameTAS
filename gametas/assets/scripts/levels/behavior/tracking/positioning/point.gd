extends Node

class_name Point

var velocity: Vector2

func apply(next, speed):
	velocity = next
	velocity += speed

func check(finish):
	return velocity == finish

func move(actor, speed):
	actor.move(speed)
