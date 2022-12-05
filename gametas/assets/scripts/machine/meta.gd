extends Node
class_name meta

enum states { none = -1, idle, move, attack, jump }

class input:
	var actions: Array

	func _init(_actions: Array):
		actions = _actions
