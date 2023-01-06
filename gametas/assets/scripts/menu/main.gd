extends Node

func _ready():
	$menu/centered/aspect/options/start.grab_focus()

func _on_start_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://assets/scenes/levels/start.tscn")


func _on_exit_pressed():
	get_tree().quit()
