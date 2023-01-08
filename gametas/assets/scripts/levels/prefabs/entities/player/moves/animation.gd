extends AnimatedSprite

class_name Look

onready var tree = $tree

var max_combo = 3

func move(velocity):
	var side = velocity.normalized()
	tree.set("parameters/down_actions/run/blend_position", side)
	for tact in max_combo:
		tree.set("parameters/down_actions/base_combo/%s/blend_position" % (tact + 1), side)

func attack(current):
	tree.get("parameters/down_actions/base_combo/playback").travel(str(current))
		
func battle_stance():
	tree.get("parameters/down_actions/playback").travel("base_combo")

func run():
	tree.get("parameters/down_actions/playback").travel("run")
