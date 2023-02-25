extends Node

class_name Leaf

var full_name: String
var leaf_name: String
var category: String

func set_leaf(name):
	
	leaf_name = name


func group(name):
	
	category = name
	full_name = category + "_" + leaf_name


func state(blackboard):
	
	blackboard.set(full_name, false)


func next_leaf(blackboard, next):
	
	blackboard.set(full_name, true)
	blackboard.set(category + "_" + next, false)
