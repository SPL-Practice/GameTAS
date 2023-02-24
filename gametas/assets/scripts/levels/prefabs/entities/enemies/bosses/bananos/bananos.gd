extends KinematicBody2D

var velocity = Vector2(0, 0)

onready var behavior = $behavior
onready var blackboard = $blackboard
onready var look = $shape/look
onready var animation = $animation
onready var health = $health
onready var power = $power

func _ready():
	blackboard.set("position", velocity)
	var phases = behavior.get_child(0)
	for phase in phases.get_children():
		for turn in phase.get_children():
			blackboard.set(turn.name, false)

func kill():
	queue_free()
	get_tree().change_scene("res://assets/scenes/menu/authors/ending/bad.tscn")

func move(speed: Vector2):
	look.move(speed)
	move_and_slide(speed)

func move_partial(x, y):
	velocity.x = x
	velocity.y = y
	move(velocity)

func move_vertical(y):
	move_partial(0, y)

func move_horizontal(x):
	move_partial(x, 0)

func _physics_process(delta):
	behavior.tick(self, blackboard)

func _on_slug_body_entered(body):
	body.health.hold_damage(power.value)

func _on_slug_body_exited(body):
	body.health.release_damage(power.value)
