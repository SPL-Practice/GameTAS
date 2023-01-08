extends Node

var character: Dictionary

export var level: int = 0
export var xp: int = 0

func _set_base_stat_level(name):
	character[name] = { "level" : level, "xp" : xp }

func _ready():
	_set_base_stat_level("power")
	_set_base_stat_level("speed")
	_set_base_stat_level("sanity")
	pass
