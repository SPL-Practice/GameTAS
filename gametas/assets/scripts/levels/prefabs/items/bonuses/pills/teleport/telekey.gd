extends "res://assets/scripts/levels/prefabs/items/bonuses/pills/teleport/telepill.gd"

export (String) var key

func _change_scene():
	Manager.environment[key] = true
	._change_scene()
