extends Node

func _ready():
	pass
	
func _on_Timer_timeout():
	get_tree().change_scene("res://assets/scenes/levels/end/goodend.tscn")


func _on_Area2D_body_entered(_body):
	get_tree().change_scene("res://assets/scenes/levels/scene1/level1.tscn")

