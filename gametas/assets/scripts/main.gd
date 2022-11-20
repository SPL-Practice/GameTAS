extends Node

func _ready():
	$menu/centered/aspect/options/start.grab_focus()



func _on_Start_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://assets/scenes/levels/scene0/office.tscn")


func _on_Quit_pressed():
	get_tree().quit()
