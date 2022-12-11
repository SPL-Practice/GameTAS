extends KinematicBody2D

var velocity = Vector2()
var speed = 400

onready var blackboard = $blackboard
onready var behaviour = $behaviour
onready var moves = $shape/look

func press_power(main, alternate):
	return Input.get_action_strength(main) - Input.get_action_strength(alternate)

func up(multiplier: int):
	var input = press_power("ui_down", "ui_up")
	velocity.y = speed * multiplier * input
	return input

func right(multiplier: int):
	var input = press_power("ui_right", "ui_left")
	velocity.x = speed * multiplier * input
	return input
	
func move():
	velocity.x = press_power("ui_right", "ui_left")
	velocity.y = press_power("ui_down", "ui_up")
	return velocity

func _physics_process(delta):
	behaviour.tick(self, $blackboard)
	move_and_slide(velocity * speed)
	velocity = Vector2.ZERO
