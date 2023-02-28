extends Node

onready var rand = RandomNumberGenerator.new()
onready var noise = OpenSimplexNoise.new()

export (int) var strength: float = 20.0
export (int) var speed: float = 10.0
export (int) var decay: float = 5.0

var power: float = 0.0
var current: float = 0.0


func apply_shake():
	
	power = strength


func shake(delta):
	
	power = lerp(power, 0, decay * delta)
	return get_noise_offset(delta)


func get_noise_offset(delta: float):
	
	current += delta * speed
	
	return Vector2(
		noise.get_noise_2d(1, current) * power,
		noise.get_noise_2d(100, current) * power
	)
