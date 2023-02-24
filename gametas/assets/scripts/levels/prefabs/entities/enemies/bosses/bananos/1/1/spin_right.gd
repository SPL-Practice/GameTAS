extends "res://addons/godot-behavior-tree-plugin/action.gd"

const position = "position"

onready var turn = self.name

export (Vector2) var speed = Vector2(500, 500)
export (Vector2) var finish = Vector2(50000, 50000)
export (String) var next = "vertical"
export (int) var breakdown = FAILED

func tick(tick: Tick):
	
	if (tick.blackboard.get(turn)):
		return FAILED
	
	var velocity = tick.blackboard.get(position)
	velocity += speed
	
	if (velocity == finish):
		tick.blackboard.set(turn, true)
		tick.blackboard.set(next, false)
		return OK
	
	tick.actor.move(speed)
	tick.blackboard.set(position, velocity)
	return OK
