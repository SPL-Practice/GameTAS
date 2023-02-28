extends Node

signal advance(level)
signal increase_experience(amount)

export onready var stat = get_parent()

export (Array, int) onready var values
export (Array, int) onready var next

var level: int = 0 setget _set_level
var xp: int = 0 setget _set_experience

func destroy():
	emit_signal("increase_experience", next[level-1])
	queue_free()

func setup():
	_set_level(Manager.character[stat.name]["level"])
	experience(Manager.character[stat.name]["xp"])

func _increase():
	stat.value = values[level]
	
	if level == next.size():
		emit_signal("advance", level, 0)
		destroy()
	else:
		emit_signal("advance", level, next[level])

func _ready():
	setup()
	_increase()

func _set_level(value):
	level = value
	_increase()

func _level_up():
	_set_level(level + 1)
	if level == next.size():
		destroy()
	Manager.character[stat.name]["level"] = level

func _set_experience(amount):
	xp += amount
	while level < next.size() and xp >= next[level]:
		xp -= next[level]
		_level_up()
		
	emit_signal("increase_experience", xp)

func experience(amount):
	_set_experience(amount)
	Manager.character[stat.name]["xp"] = xp
