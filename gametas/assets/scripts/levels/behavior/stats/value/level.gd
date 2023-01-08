extends Node

signal advance(level)
signal increase_experience(amount)

export onready var stat = get_parent()

export (Array, int) onready var values
export (Array, int) onready var next

var level: int = 0
var xp: int = 0

func _increase():
	stat.value = values[level]

func _ready():
	_increase()
	emit_signal("advance", level)

func _level_up():
	level += 1
	_increase()
	emit_signal("advance", level, next[level])
	if level == next.size():
		emit_signal("increase_experience", next[level-1])
		queue_free()

func experience(amount):
	xp += amount
	while xp >= next[level]:
		xp -= next[level]
		_level_up()
	emit_signal("increase_experience", xp)
