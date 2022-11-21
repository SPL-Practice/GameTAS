extends Area2D

func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://assets/scenes/levels/scene1/level1.tscn")


func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	get_tree().change_scene("res://assets/scenes/levels/scene1/level1.tscn")
