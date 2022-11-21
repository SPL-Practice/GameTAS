extends Area2D

onready var anim = $AnimationPlayer
onready var character = get_parent()

func attack():
	anim.play("attack")

func _on_weapon_body_entered(body):
	body.damage(character.power)
