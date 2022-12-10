extends "res://addons/godot-behavior-tree-plugin/action.gd"

func tick(tick: Tick) -> int:
	if Input.is_action_pressed("ui_left"):
		tick.actor._right(-1, tick.actor.Run.LEFT)
		return OK
	else:
		return FAILED
	
	"""
	elif Input.is_action_pressed("ui_right"):
		velocity.x = speed
		if animate_tree.get("parameters/run/current") != 4:
			animate_tree.set("parameters/run/current", 1)
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = -speed
		if animate_tree.get("parameters/run/current") != 4:
			animate_tree.set("parameters/run/current", 2)
	elif Input.is_action_pressed("ui_down"):
		velocity.y = speed
		if animate_tree.get("parameters/run/current") != 4:
			animate_tree.set("parameters/run/current", 3)
	"""
