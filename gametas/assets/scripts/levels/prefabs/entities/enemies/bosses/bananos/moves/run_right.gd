extends "res://addons/godot-behavior-tree-plugin/action.gd"

export (int) var speed = 500
export (int) var finish = 50000
export (String) var next = "vertical"

var leaf = Leaf.new()
var run = Positioner.new()

func _ready():
	leaf.set_leaf(self.name)
	run.pointing = Point_X.new()

func tick(tick: Tick):
	
	if (tick.blackboard.get(leaf.full_name)):
		return FAILED
	
	run.start(tick.blackboard, speed)
	run.move(tick, speed)
	
	if (run.check(finish)):
		leaf.next_leaf(tick.blackboard, next)
	
	return OK
