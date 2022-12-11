extends "res://addons/godot-behavior-tree-plugin/action.gd"

func tick(tick: Tick) -> int:
	if Input.is_action_pressed("ui_attack"):
		tick.actor.weapon.attack()
		tick.actor.moves.travel_to("base_attack")
		#var move = tick.actor.moves
		#move.action(move.Act.ATTACK)
		#move.attack(move.Hit.BASE)
		return OK
	return FAILED
