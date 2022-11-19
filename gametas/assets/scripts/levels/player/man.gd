extends KinematicBody2D

signal health_updated(health)
signal max_health_updated(health)
signal killed()

var velocity = Vector2()
var speed = 400

export (float) var max_health = 25
onready var health = max_health setget _set_health
onready var invulnerability_timer = $invulnerability
onready var animation = $animation

func sanity_up(amount):
	emit_signal("max_health_updated", max_health + amount)

func damage(amount):
	if invulnerability_timer.is_stopped():
		invulnerability_timer.start()
		_set_health(health - amount)
		animation.play("damage")

func kill():
	print("killed")
	queue_free()

func _set_health(value):
	var prev_health = health
	health = clamp(value, 0, max_health);
	if health != prev_health:
		emit_signal("health_updated", health)
		if health == 0:
			kill()
			emit_signal("killed")

func _physics_process(delta):
	velocity.x = 0
	velocity.y = 0
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	elif Input.is_action_pressed("ui_right"):
		velocity.x = speed
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = -speed
	elif Input.is_action_pressed("ui_down"):
		velocity.y = speed
			
	move_and_slide(velocity)


func _on_invulnerability_timeout():
	invulnerability_timer.stop()
