extends "res://addons/godot-behavior-tree-plugin/action.gd"

export (int) var next_phase = 1
export (int) var next_hp = 200

var leaf = Leaf.new()

func _ready():
	leaf.set_leaf(self.name)

func health_check(tick: Tick) -> int:
	
	if (tick.blackboard.get(leaf.full_name)):
		return FAILED
	
	if (tick.actor.health.is_killed()):
		tick.actor.health.get_node("max").value = next_hp
		tick.actor.new_phase(next_phase)
		tick.blackboard.set(Positioner.position, Vector2(0, 0))
		tick.blackboard.set(leaf.full_name, true)
		return FAILED
	
	return OK


func tick(tick: Tick) -> int:
	
	return health_check(tick)
