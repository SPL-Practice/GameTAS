extends KinematicBody2D

var velocity = Vector2()
var speed = 400

onready var animate_tree = $tree

func _physics_process(delta):
	velocity.x = 0
	velocity.y = 0
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		if animate_tree.get("parameters/run/current") != 4:
			animate_tree.set("parameters/run/current", 0)
	elif Input.is_action_pressed("ui_right"):
		velocity.x = speed
		if animate_tree.get("parameters/run/current") != 4:
			animate_tree.set("parameters/run/current", 1)
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = -speed
		if animate_tree.get("parameters/run/current") != 4:
			animate_tree.set("parameters/run/current", 2)
	elif Input.is_action_pressed("ui_down"):
		velocity.y = speed
		if animate_tree.get("parameters/run/current") != 4:
			animate_tree.set("parameters/run/current", 3)
			
	move_and_slide(velocity)

func _on_door_body_entered(body):	
	pass
	#get_tree().change_scene("res://assets/scenes/levels/end/good.tscn")
	#print(body.get_name())
	#if body.get_name() == "door":
	#	
	#else:
		#get_tree().change_scene("res://assets/scenes/levels/scene1/level1.tscn")
