extends CollisionShape2D

onready var wielder = get_parent()
onready var tree = $tree
onready var combos = $combos
onready var melee = get_state("melee")
onready var base_combo = get_state("melee/base_combo")
onready var charge = get_state("melee/charge")

var combo = 0
var max_combo = 2

func get_state(states):
	return tree.get("parameters/%s/playback" % states)

func turn(blend, velocity):
	tree.set(Look.blender(blend), velocity.normalized())

func move(velocity):
	turn("melee/charge", velocity)
	for tact in max_combo:
		turn("melee/base_combo/%s" % tact, velocity)

func stop_combo():
	combo = 0
	combos.stop()
	wielder.idle()

func attack():
	combo += 1
	base_combo.travel(str(combo))
	wielder.attack(combo)
	if (combos.is_stopped()):
		melee.travel("base_combo")
		combos.start()
	elif combo >= max_combo:
		stop_combo()
