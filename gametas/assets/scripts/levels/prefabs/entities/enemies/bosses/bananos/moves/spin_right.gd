extends "res://addons/godot-behavior-tree-plugin/action.gd"

export (Vector2) var speed = Vector2(500, 500)
export (Vector2) var finish = Vector2(50000, 50000)
export (String) var next = "vertical"
export (int) var breakdown = FAILED

var leaf = Leaf.new()
var run = Positioner.new()

func _ready():
	leaf.set_leaf(self.name)
	run.pointing = Point.new()

func tick(tick: Tick):
	
	if (tick.blackboard.get(leaf.full_name)):
		return FAILED
	
	run.start(tick.blackboard, speed)
	run.move(tick, speed)
	
	if (run.check(finish)):
		leaf.next_leaf(tick.blackboard, next)
	
	return OK
	
