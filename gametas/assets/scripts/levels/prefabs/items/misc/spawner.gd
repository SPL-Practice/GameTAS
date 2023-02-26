extends Area2D

onready var target = get_parent()
export (Resource) var prefab = null

func _spawn(_body):
	
	var object = prefab.instance()
	target.call_deferred("add_child", object)

func _spawn_done(_body):
	queue_free()
