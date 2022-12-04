extends Area2D

export var scene = "levels/office/distorted/1.tscn"

func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://assets/scenes/" + scene)
