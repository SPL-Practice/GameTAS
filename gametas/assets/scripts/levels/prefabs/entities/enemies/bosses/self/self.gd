extends KinematicBody2D

signal phase_updated(number)
signal defeat()

export (String) var ending = "res://assets/scenes/menu/authors/ending/bad.tscn"

var velocity = Vector2()
var previous = Vector2(1, 1)
onready var initial = self.position

onready var behavior = $behavior
onready var blackboard = $blackboard
onready var look = $shape/look
onready var animation = $animation
onready var health = $stats/health

func _ready():
	blackboard.set("position", velocity)
	behavior.state(blackboard)

func kill():
	emit_signal("defeat")
	look.scene()
	
func death():
	queue_free()
	print_debug(get_tree().change_scene(ending))

func new_phase(no):
	emit_signal("phase_updated", no)
	if (no < behavior.phase_count):
		self.position = initial

func move(speed: Vector2):
	look.move(move_and_slide(speed))

func move_partial(x, y):
	velocity.x = x
	velocity.y = y
	move(velocity)

func move_vertical(y):
	move_partial(0, y)

func move_horizontal(x):
	move_partial(x, 0)

func _physics_process(delta):
	blackboard.set("delta", delta)
	behavior.tick(self, blackboard)
