extends Node2D

onready var attacks = $attacks
onready var base_slash = $attacks/base_slash

onready var behaviour = $behavior

func _ready():
	for attack in attacks.get_children():
		attack.set_wielder(get_parent())

func move(velocity):
	for attack in attacks.get_children():
		attack.move(velocity)

func attack():
	base_slash.attack()
	
func _physics_process(_delta):
	behaviour.tick(self, $blackboard)
