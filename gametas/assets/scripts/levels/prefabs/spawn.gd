extends Node

export (Resource) var prefab = null

func _spawn(position):
	var object = prefab.instance()
	object.position = position
	call_deferred("add_child", object)
