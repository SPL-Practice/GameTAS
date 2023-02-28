extends "res://assets/scripts/ui/sanity.gd"

onready var invincibility = $fill/invincibility

func _ready():
	var spare = health.get_node("spare")
	spare.connect("value_updated", self, "_on_spare_time_increased")
	spare.connect("spare_invulnerability", self, "_on_spare_invulnerability")
	_on_spare_time_increased(spare.value)

func _on_spare_time_increased(value):
	invincibility.max_value = value

func _on_spare_invulnerability(value):
	invincibility.value = value
