extends AnimatedSprite

class_name Look

onready var tree = $tree

var max_combo = 3

func move(velocity):
	var side = velocity.normalized()
	tree.set("parameters/actions/run/blend_position", side)
	for tact in max_combo:
		tree.set("parameters/actions/base_combo/%s/blend_position" % (tact + 1), side)

func attack(current):
	tree.get("parameters/actions/base_combo/playback").travel(str(current))
		
func battle_stance():
	tree.get("parameters/actions/playback").travel("base_combo")

func run():
	tree.get("parameters/actions/playback").travel("run")
