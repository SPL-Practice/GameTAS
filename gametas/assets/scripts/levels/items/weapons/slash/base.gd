extends Area2D

var wielder
onready var tree = $shape/look/tree
onready var combos = $combos

var combo = 1
var power = [1, 1.25, 1.75]

func set_wielder(wields):
	wielder = wields

func move(velocity):
	for tact in power.size():
		tree.set("parameters/base_melee_combo/%s/blend_position" % (tact + 1), velocity.normalized())

func stop_combo():
	combo = 1
	combos.stop()
	wielder.look.run()

func attack():
	tree.get("parameters/base_melee_combo/playback").travel(str(combo))
	wielder.look.attack(combo)
	if (combos.is_stopped()):
		wielder.look.battle_stance()
		tree.set("parameters/melee/current", 0)
		combos.start()
		combo += 1
	elif combo >= power.size():
		stop_combo()
	else:
		combo += 1

func _on_weapon_body_entered(body):
	body.health.damage(wielder.power.value * power[combo-1])
