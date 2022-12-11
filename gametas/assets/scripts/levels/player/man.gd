extends "res://assets/scripts/levels/player/noman.gd"

signal health_updated(health)
signal max_health_updated(health)
signal killed()

var constant_damage = 0
var sanity_drop = 1

var speed_lv = 1

export (int) var power = 5
var skill = 1

export (int) var max_health = 25
onready var health = max_health setget _set_health
onready var torso = $shape
onready var invulnerability_timer = $invulnerability
onready var sanity_timer = $sanity
onready var weapon = $weapon

func boost_invulnerability_time(bonus):
	invulnerability_timer.wait_time *= bonus
	
func boost_sanity_time(bonus):
	sanity_timer.wait_time *= bonus
	
func boost_sanity_drop(bonus):
	sanity_drop = max(sanity_drop + bonus, 0);
	
func weaponed(_bonus):
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
		#animation.set("parameters/run/current", 5)

func kill():
	queue_free()
	get_tree().change_scene("res://assets/scenes/menu/logo.tscn")

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

func _on_invulnerability_timeout():
	invulnerability_timer.stop()
	if constant_damage > 0 and health > 0:
		damage(constant_damage)

func _on_sanity_timeout():
	if health > 0:
		damage(sanity_drop)
		sanity_timer.start()
