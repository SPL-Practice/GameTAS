extends Area2D


func _on_Area2D2_body_entered(body):
	print("WORKED")
	get_tree().change_scene("res://assets/scenes/levels/end/goodend.tscn")


func _on_door_body_entered(body):
	print("WORKED")
	get_tree().change_scene("res://assets/scenes/levels/end/goodend.tscn")
