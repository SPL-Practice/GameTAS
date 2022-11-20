extends Area2D

func _on_Node2D_body_entered(body):
	get_tree().change_scene("res://assets/scenes/levels/scene1/level1.tscn")

