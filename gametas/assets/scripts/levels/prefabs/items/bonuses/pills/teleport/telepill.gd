extends Node

export var scene = "res://assets/scenes/levels/office/distorted/1.tscn"

func _change_scene():
	print_debug(get_tree().change_scene(scene))

func _on_area_body_entered(_body):
	_change_scene()
