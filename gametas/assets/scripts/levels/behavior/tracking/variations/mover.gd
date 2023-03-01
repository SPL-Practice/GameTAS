extends Node

onready var path = get_parent()
onready var behavior = $behavior
onready var blackboard = $blackboard

func _physics_process(_delta):
	behavior.tick(self, blackboard)
