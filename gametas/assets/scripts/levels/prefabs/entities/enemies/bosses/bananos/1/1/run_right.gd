extends "res://addons/godot-behavior-tree-plugin/action.gd"

const position = "position"

onready var turn = self.name

export (int) var speed = 500
export (int) var finish = 50000
export (String) var next = "vertical"

func tick(tick: Tick):
	
	if (tick.blackboard.get(turn)):
		return FAILED
	
	var velocity = tick.blackboard.get(position)
	velocity.x += speed
	
	if (velocity.x == finish):
		tick.blackboard.set(turn, true)
		tick.blackboard.set(next, false)
		return OK
	
	tick.actor.move_horizontal(speed)
	tick.blackboard.set(position, velocity)
	return OK
