extends Reference
class_name state

var agent: KinematicBody2D

func _init(_agent: KinematicBody2D):
	agent = _agent

func input(fsm_input: meta.input) -> int:
	return fsm_input.states.none

func update(fsm_input: meta.input, delta: float) -> void:
	pass

func enter() -> void:
	pass
	
func exit() -> void:
	pass
