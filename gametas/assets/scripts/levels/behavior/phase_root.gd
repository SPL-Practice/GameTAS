extends "res://addons/godot-behavior-tree-plugin/behavior_tree.gd"

func _recurse_group(parent, name):
	
	for child in parent.get_children():
		if ("leaf" in child):
			child.leaf.group(name)
		_recurse_group(child, name + "_" + child.name)


func _recurse_state(parent, blackboard):
	
	for child in parent.get_children():
		if ("leaf" in child):
			child.leaf.state(blackboard)
		_recurse_state(child, blackboard)


func state(blackboard):
	
	_recurse_state(self, blackboard)


func _ready():
	
	._ready()
	_recurse_group(self, self.name)
