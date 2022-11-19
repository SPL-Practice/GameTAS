extends Node

func _ready():
	$VBoxContainer/Start.grab_focus()



func _on_Start_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://assets/scenes/levels/scene1/level1.tscn")


func _on_Quit_pressed():
	get_tree().quit()
