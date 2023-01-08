extends Control

onready var level = $level
onready var xp = $xp

export var node_name = "player"
export var stat_name: String

onready var stat = get_parent().get_parent().get_parent().get_parent().get_parent().get_node(node_name).get_node(stat_name).get_node("level")

func _ready():
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
