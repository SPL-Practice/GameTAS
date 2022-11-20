extends Area2D

onready var anim = $AnimationPlayer

func attack():
	anim.play("attack")



func _on_weapon_body_entered(body):
	if body.has_method("handle_hit"):
		body.handle_hit
