extends Node

func _ready():
	pass
	
func _on_Timer_timeout():
	get_tree().change_scene("res://assets/scenes/levels/end/goodend.tscn")
