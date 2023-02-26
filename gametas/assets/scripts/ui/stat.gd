extends Control

onready var level = $level
onready var xp = $xp

export (int) var depth = 5
export (String) var path

var stat

func _search(child):
	for node in depth:
		child = child.get_parent()
	return child

func _ready():
	stat = _search(self).get_node(path)
	stat.connect("advance", self, "_on_advance")
	stat.connect("increase_experience", self, "_on_increase_experience")
	_on_increase_experience(stat.xp)
	_on_advance(stat.level, stat.next[stat.level])
	level.max_value = stat.next.size()
	xp.max_value = stat.next[stat.level]

func _on_increase_experience(value):
	xp.value = value
	
func _on_advance(value, next):
	level.value = value
	xp.max_value = next
