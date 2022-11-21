extends Control

func _ready():
	$supregression/menu.grab_focus()

func _on_menu_pressed():
	get_tree().change_scene("res://assets/scenes/menu/main.tscn")
