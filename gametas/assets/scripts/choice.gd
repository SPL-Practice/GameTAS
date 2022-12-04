extends Node

func _on_Timer_timeout():
	get_tree().change_scene("res://assets/scenes/menu/ending/good.tscn")


func _on_Area2D_body_entered(_body):
	get_tree().change_scene("res://assets/scenes/menu/ending/good.tscn")

