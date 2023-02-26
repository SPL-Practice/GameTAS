extends KinematicBody2D
onready var velocity = Vector2()

onready var blackboard = $blackboard
onready var behaviour = $behaviour
onready var look = $shape/look

onready var speed = $stats/speed

func press_power(main, alternate):
	return Input.get_action_strength(main) - Input.get_action_strength(alternate)
	
func move():
	velocity.x = press_power("ui_right", "ui_left")
	velocity.y = press_power("ui_down", "ui_up")
	return velocity

func _physics_process(delta):
	behaviour.tick(self, blackboard)
	move_and_slide(velocity * speed.value)
	velocity = Vector2.ZERO
