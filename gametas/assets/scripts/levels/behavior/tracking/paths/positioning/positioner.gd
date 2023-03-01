extends Node

class_name Positioner

const position = "position"

var pointing

func start(blackboard, speed):
	pointing.apply(blackboard.get(position), speed)

func check(finish):
	return pointing.check(finish)

func move(tick, speed):
	pointing.move(tick.actor, speed)
	tick.blackboard.set(position, pointing.velocity)
