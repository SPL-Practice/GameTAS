extends Node

export (int) var value = 1
export (String) var path

func _on_pill_body_entered(body):
	var stat = body.get_node(path)
	if (is_instance_valid(stat)):
		stat.experience(value)
	queue_free()
