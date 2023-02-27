extends "res://assets/scripts/levels/prefabs/items/bonuses/pills/telepill.gd"

export (String) var key = "is_pill_touched"

func _change_scene():
	if Manager.environment[key]:
		._change_scene()
