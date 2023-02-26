extends KinematicBody2D

signal phase_updated(number)
signal defeat()

var velocity = Vector2(0, 0)
onready var initial = self.position

onready var behavior = $behavior
onready var blackboard = $blackboard
onready var look = $shape/look
onready var animation = $animation
onready var health = $stats/health
onready var power = $stats/power

func _ready():
	blackboard.set("position", velocity)
	behavior.state(blackboard)

func kill():
	emit_signal("defeat")
	look.scene()
	
func death():
	queue_free()
	get_tree().change_scene("res://assets/scenes/menu/authors/ending/bad.tscn")

func new_phase(no):
	emit_signal("phase_updated", no)
	if (no < behavior.phase_count):
		self.position = initial

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
