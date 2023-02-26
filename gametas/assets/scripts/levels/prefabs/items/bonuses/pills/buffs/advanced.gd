extends Area2D

export (int) var value = 5
export (Array, String) var nodes

func _search(current):
	for node in nodes:
		current = current.get_node(node)
	return current

func _on_pill_body_entered(body):
	var stat = _search(body)
	if (is_instance_valid(stat)):
		stat.increase(value)
	queue_free()
