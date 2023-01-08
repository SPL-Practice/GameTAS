extends Node

signal value_updated(current)

export (int) var value setget _set_value

func _set_value(next):
	value = next
	emit_signal("value_updated", next)
