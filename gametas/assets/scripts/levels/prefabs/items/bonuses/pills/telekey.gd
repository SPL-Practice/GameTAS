extends "res://assets/scripts/levels/prefabs/items/bonuses/pills/telepill.gd"

export (String) var key

func _change_scene():
	Manager.environment[key] = true
	._change_scene()
