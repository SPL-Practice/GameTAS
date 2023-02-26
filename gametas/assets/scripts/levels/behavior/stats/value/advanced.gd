extends "res://assets/scripts/levels/behavior/stats/value/stat.gd"

export (int) var maximum

func _ready():
	_set_value(Manager.character[self.name]["value"])

func increase(buff):
	_set_value(min(value + buff, maximum))
	Manager.character[self.name]["value"] = value
