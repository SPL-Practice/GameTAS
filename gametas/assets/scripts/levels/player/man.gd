extends KinematicBody2D

signal health_updated(health)
signal max_health_updated(health)
signal killed()

var velocity = Vector2()
var constant_damage = 0
var sanity_drop = 1

var speed = 400
var speed_lv = 1

var power = 1
var skill = 1

export (float) var max_health = 25
onready var health = max_health setget _set_health
onready var torso = $shape
onready var invulnerability_timer = $invulnerability
onready var sanity_timer = $sanity
onready var animation = $animation
onready var animate_tree = $tree
onready var weapon = $weapon


func boost_invulnerability_time(bonus):
	invulnerability_timer.wait_time * bonus
	
func boost_sanity_time(bonus):
	sanity_timer.wait_time * bonus
	
func boost_sanity_drop(bonus):
	sanity_drop = max(sanity_drop + bonus, 0);
	
func weapon(bonus):
	pass

func sanity_up(amount):
	max_health += amount
	emit_signal("max_health_updated", max_health)
	_set_health(max_health)

func release_damage(amount):
	constant_damage -= amount

func hold_damage(amount):
	constant_damage += amount
	damage(amount)

func damage(amount):
	if invulnerability_timer.is_stopped():
		invulnerability_timer.start()
		_set_health(health - amount)
		animation.play("damage")

func kill():
	print("killed")
	queue_free()

func heal(value):
	 _set_health(health + value)

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
		animate_tree.set("parameters/run/current", 0)
		velocity.x = -speed
	elif Input.is_action_pressed("ui_right"):
		velocity.x = speed
		animate_tree.set("parameters/run/current", 1)
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = -speed
		animate_tree.set("parameters/run/current", 2)
	elif Input.is_action_pressed("ui_down"):
		velocity.y = speed
		animate_tree.set("parameters/run/current", 3)
			
	move_and_slide(velocity)
	#weapon.rotation = mouse_direction.angle()


func _on_invulnerability_timeout():
	invulnerability_timer.stop()
	if constant_damage > 0 and health > 0:
		damage(constant_damage)

func _on_sanity_timeout():
	pass
	#sanity_timer.stop()
	#if health > 0:
	#	damage(sanity_drop)
	#	sanity_timer.start()

func _unhandled_input(event:InputEvent)-> void:
	if event.is_action_pressed("ui_attack"):
		weapon.attack()

func _on_door_body_entered(body):
	get_tree().change_scene("res://assets/scenes/levels/end/goodend.tscn")


func _on_Area2D_body_entered(body):
	get_tree().change_scene("res://assets/scenes/levels/scene1/level1.tscn")
