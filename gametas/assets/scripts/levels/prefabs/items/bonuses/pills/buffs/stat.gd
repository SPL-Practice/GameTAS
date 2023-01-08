extends Node

export var value: int = 1
export var node: String

func _on_pill_body_entered(body):
	var stat = body.get_node(node).get_node("level")
	if (is_instance_valid(stat)):
		stat.experience(value)
	queue_free()
