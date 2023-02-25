extends AnimatedSprite

class_name Look

onready var tree = $tree

enum character { DANGEROUS, PASSIVE }

enum danger { ATTACK, DASH }

enum attack { SLASHES, SHOOTING }
enum slashes { COMBO, SWING }
enum shooting { PROJECTILES, CHARGE }

enum passion { RUN, IDLE }

var max_combo = 3
var walk = 0

func _run_direction(direction):
	
	tree.set("parameters/run/blend_position", direction)

func attack_direction(current, direction):
	
	tree.set("parameters/combo/%s/blend_position" % current, direction)
	print_debug("parameters/combo/%s/blend_position" % current)
	
func _attacks_direction(direction):
	
	for tact in max_combo:
		tree.set("parameters/combo/%s/blend_position" % (tact + 1), direction)

func perform_passion(standing):
	
	tree.set("parameters/passive/current", standing)

func move(velocity):
	
	var side = velocity.normalized()
	_run_direction(side)

func _go_emotion(calm):
	
	tree.set("parameters/character/current", calm)
	
func _perform_danger(movement):
	
	tree.set("parameters/dangerous/current", movement)
	
func _attack_with(style):
	
	tree.set("parameters/attack/current", style)
	
func _do_slash(kind):
	
	tree.set("parameters/slashes/current", kind)
	
func _slash_combo(pose):
	
	tree.get("parameters/combo/playback").travel(str(pose))
	print_debug(pose)


func slashing():
	
	_perform_danger(danger.ATTACK)
	_attack_with(attack.SLASHES)

func slash(current):
	
	_do_slash(slashes.COMBO)
	_slash_combo(current)
	
func battle_stance():
	
	_go_emotion(character.DANGEROUS)

func run():
	
	_go_emotion(character.PASSIVE)
