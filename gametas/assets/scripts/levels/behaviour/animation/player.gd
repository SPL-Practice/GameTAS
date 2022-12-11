extends AnimatedSprite

onready var tree = $tree
onready var player = $tree/animation
onready var state = tree.get("parameters/down_actions/playback")

enum Run { LEFT, RIGHT, TOP, DOWN }
enum Act { ATTACK, RUN, IDLE }
enum Hit { BASE, CHARGE }

#onready var is_attacking = false setget set_attack
var directions = ["left","right","up","down"]
var turned = Run.DOWN
var acted = Act.RUN

#"idle",,"charge_attack"
var blends = ["run","base_attack"]
#var velocity = Vector2()

func move(velocity):
	for blend in blends:
		tree.set("parameters/down_actions/%s/blend_position" % blend, velocity.normalized())

func up(y: int):
	pass
	#velocity.y = y
	#move()

func right(x: int):
	pass
	#velocity.x = x
	#move()
	
func travel_to(animation):
	state.travel(animation)

func custom(animation, type: int):
	tree.set("parameters/down_actions/run/blend_position/x", 0)
	tree.set("parameters/%s/current" % animation, type)

func attack(type: int):
	custom(directions[turned] + "side_attack", type)

func action(kind: int):
	custom(directions[turned], kind)

func turn(side: int, action: int):
	if (turned != side):
		action(action)
	custom("turn", side)
	#if (acted != action):
	#	custom(directions[side], action)
	turned = side
