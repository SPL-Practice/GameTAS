extends "res://assets/scripts/ui/sanity.gd"

onready var invincibility = $fill/invincibility

func _ready():
	health.connect("spare_time_increased", self, "_on_spare_time_increased")
	health.connect("spare_invulnerability", self, "_on_spare_invulnerability")
	_on_spare_time_increased(health.spare_time)

func _on_spare_time_increased(value):
	invincibility.max_value = value

func _on_spare_invulnerability(value):
	invincibility.value = value
