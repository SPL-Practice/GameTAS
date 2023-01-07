extends Node2D

export var scene = "levels/office/distorted/1.tscn"

func _change_scene():
	get_tree().change_scene("res://assets/scenes/" + scene)

func _on_Area2D_body_entered(_body):
	_change_scene()
