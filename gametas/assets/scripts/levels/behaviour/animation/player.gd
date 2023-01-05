extends AnimatedSprite

class_name Look

onready var tree = $tree
onready var actions = get_state("down_actions")
onready var combo = get_state("down_actions/base_combo")

var max_combo = 3

func get_state(states):
	return tree.get("parameters/%s/playback" % states)

func move(velocity):
	var side = velocity.normalized()
	tree.set("parameters/down_actions/run/blend_position", side)
	for tact in max_combo:
		tree.set("parameters/down_actions/base_combo/%s/blend_position" % (tact + 1), side)

func attack(current, is_started):
	combo.travel(str(current))
	if (is_started):
		actions.travel("base_combo")

func run():
	actions.travel("run")
