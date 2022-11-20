extends KinematicBody2D

signal health_updated(amount)
signal killed()

var velocity = Vector2()
var current = 0

export (float) var speed = 450
current = Vector2()
export (Vector3) var edge1 = [ Vector3(-4500, -4500, -4500) ]
export (Vector3) var edge2 = Vector3(4500, 4500, 4500)

var damage = 7
onready var health = 15 setget _set_health
onready var animation = $animation

func _set_max_health(max_health):
	health = max_health

func damage(amount):
	animation.play("damage")
	_set_health(health - amount)
	
func kill():
	print("killed")
	queue_free()

func heal(value):
	 _set_health(health + value)

func _set_health(value):
	var prev_health = health
	health = max(value, 0);
	if health != prev_health:
		emit_signal("health_updated", health)
		if health <= 0:
			kill()
			emit_signal("killed")
			
func _physics_process(delta):
	velocity.x = 0
	if current <= edge.x or current >= edge.y:
		speed *= -1
	current += speed
	velocity.x += speed
	
	move_and_slide(velocity)


func _on_slug_body_entered(body):
	body.hold_damage(damage)


func _on_slug_body_exited(body):
	body.release_damage(damage)
