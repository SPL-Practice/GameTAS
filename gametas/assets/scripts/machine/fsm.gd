extends Node

var current = null
const inputs = [
	"ui_up", "ui_right",
	"ui_left", "ui_down"
]

func get_actions():
	var actions := []
	for action in inputs:
		if Input.is_action_pressed(action):
			actions.append(action)
	return actions

func check_state(input):
	var id = current.input(input)
	if id != meta.states.none:
		var next = get_state(id)
		current.exit()
		current = next
		current.enter()

func handle(delta: float):
	var actions = get_actions()
	var input = meta.input.new(actions)
	check_state(input)
	current.update(input, delta)

func get_state(id: int):
	match id:
		meta.states.idle:
			return idle.new(self)
		meta.states.move:
			return move.new(self)
		meta.states.attack:
			return attack.new(self)
	push_error("Invalid state ID: %d" % id)
