extends AnimatedSprite

class_name Look

onready var tree = $tree
onready var player = $tree/animation
onready var combos = $combos
onready var state = get_state("down_actions")
onready var attacked = get_state("down_actions/base_combo")

enum Run { LEFT, RIGHT, TOP, DOWN }
enum Act { ATTACK, RUN, IDLE }
enum Hit { BASE, CHARGE }

#onready var is_attacking = false setget set_attack
var directions = ["left","right","up","down"]
var turned = Run.DOWN
var acted = Act.RUN

#"idle",,"charge_attack"
var blends = ["run","base_attack"]
var combo = 3
var current = 0
#var velocity = Vector2()



func get_state(states):
	return tree.get("parameters/%s/playback" % states)

static func blender(blend):
	return "parameters/%s/blend_position" % blend

func turn_side(blend, velocity):
	tree.set(blender("down_actions/" + blend), velocity.normalized())

func move(velocity):
	turn_side("run", velocity)
	for tact in combo:
		turn_side("base_combo/%s" % tact, velocity)
	#for blend in blends:
	#	tree.set("parameters/down_actions/%s/blend_position" % blend, velocity.normalized())

func attack():
	current += 1
	attacked.travel(str(current))
	if (combos.is_stopped()):
		travel_to("base_combo")
		combos.start()
	elif current >= combo:
		current = 0
		combos.stop()
	#current %= combo	

func travel_to(animation):
	state.travel(animation)

func custom(animation, type: int):
	tree.set("parameters/down_actions/run/blend_position/x", 0)
	tree.set("parameters/%s/current" % animation, type)

#func attack(type: int):
	#custom(directions[turned] + "side_attack", type)

#func action(kind: int):
#	custom(directions[turned], kind)

func turn(side: int, action: int):
	#if (turned != side):
	#	action(action)
	custom("turn", side)
	#if (acted != action):
	#	custom(directions[side], action)
	turned = side


func _on_combos_timeout():
	current = 0
	combos.stop()
	travel_to("run")
