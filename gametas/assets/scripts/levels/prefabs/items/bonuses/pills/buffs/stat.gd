extends Node

export (int) var value = 1
export (Array, String) var nodes

func _search(current):
	for node in nodes:
		current = current.get_node(node)
	return current

func _on_pill_body_entered(body):
	var stat = _search(body).get_node("level")
	if (is_instance_valid(stat)):
		stat.experience(value)
	queue_free()
