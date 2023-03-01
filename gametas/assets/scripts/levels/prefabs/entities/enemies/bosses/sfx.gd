extends Node

export (int) var current = 0

func _ready():
	
	get_child(current).play()


func _change_pattern(no):
	
	get_child(current).stop()
	get_child(no).play()
	current = no
