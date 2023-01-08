extends Node

#const path: String = ""
#onready var prefab = preload(path)
export (Resource) var prefab = null

func _spawn(position):
	var object = prefab.instance()
	object.position = position
	#set_deferred("add_child", object)
	call_deferred("add_child", object)
