extends Area2D

onready var anim = $AnimationPlayer
onready var character = get_parent()

var moves
onready var actions = moves.get_state("down_actions")
onready var base_attack = moves.get_state("down_actions/base_combo")
var charge_attack

onready var tree = $tree
onready var combos = $combos

var combo = 0
var max_combo = 3

func set_moves(moveset):
	moves = moveset

func stop_combo():
	combo = 0
	combos.stop()

func _on_combos_timeout():
	stop_combo()
	actions.travel("run")
		
func base_combo():
	combo += 1
	base_attack.travel(str(combo))
	if (combos.is_stopped()):
		actions.travel("base_combo")
		combos.start()
	elif combo >= max_combo:
		stop_combo()

func move(velocity):
	tree.set(Look.blender("melee/base_combo"), velocity.normalized())
	tree.set(Look.blender("melee/c"), velocity.normalized())

func attack():
	anim.play("attack")

func _on_weapon_body_entered(body):
	body.damage(character.power)
