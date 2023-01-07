extends Node

onready var path = get_parent()
onready var behavior = $behavior
onready var blackboard = $blackboard

export (Vector2) var edge = Vector2(-4500, 4500)

func _physics_process(delta):
	behavior.tick(self, blackboard)
