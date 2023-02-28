extends Node

var character: Dictionary
var environment: Dictionary

export var level: int = 0
export var xp: int = 0

func _set_stat(name, value):
	character[name] = { "value" : value }

func _set_base_stat_level(name):
	character[name] = { "level" : level, "xp" : xp }

func _ready():
	environment = { "is_pill_touched" : false }
	_set_base_stat_level("power")
	_set_base_stat_level("speed")
	_set_base_stat_level("damage")
	_set_stat("max", 25)
	_set_stat("spare", 10)
