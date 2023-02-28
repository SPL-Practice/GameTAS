extends "res://assets/scripts/levels/behavior/stats/value/advanced.gd"

signal spare_started()
signal spare_invulnerability(current)
signal spare_ended()

onready var invulnerability = $invulnerability
onready var current = value
export (int) var drop = 1

func _on_damage():
	
	emit_signal("spare_started")
	invulnerability.start()


func _on_invulnerability_timeout():
	
	emit_signal("spare_invulnerability", current)
	if current > 0:
		current -= drop
		return
	
	current = value
	invulnerability.stop()
	emit_signal("spare_ended")
