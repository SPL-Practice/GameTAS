extends Area2D

var wielder
onready var tree = $shape/look/tree
onready var combos = $combos
onready var base_combo = get_state("base_melee_combo")

var combo = 0
var power = [1, 1.25, 1.75]

func set_wielder(wields):
	wielder = wields

func get_state(states):
	return tree.get("parameters/%s/playback" % states)

func move(velocity):
	for tact in power.size():
		tree.set("parameters/base_melee_combo/%s/blend_position" % (tact + 1), velocity.normalized())

func stop_combo():
	combo = 0
	combos.stop()
	wielder.look.run()

func attack():
	combo += 1
	base_combo.travel(str(combo))
	var is_started = combos.is_stopped()
	wielder.look.attack(combo, is_started)
	if (is_started):
		tree.set("parameters/melee/current", 0)
		combos.start()
	elif combo >= power.size():
		stop_combo()

func _on_weapon_body_entered(body):
	body.damage(wielder.power.value * power[combo])
