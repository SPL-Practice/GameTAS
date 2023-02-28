extends "res://assets/scripts/levels/behavior/stats/value/stat.gd"

signal sanity_sap(value)

onready var sap = $sap

export (int) var drop = 1
export (bool) var vulnerable = true

var current = value

func _ready():
	_set_vulnerability(vulnerable)

func _set_vulnerability(can):
	vulnerable = can
	if vulnerable:
		sap.start()
	else:
		sap.stop()

func increase(bonus):
	_set_value(bonus)
	if value <= 0:
		vulnerable = false

func _on_sap_timeout():
	if current > 0:
		current -= 1
		return
	
	current = value
	emit_signal("sanity_sap", drop)

func _dead():
	sap.stop()
