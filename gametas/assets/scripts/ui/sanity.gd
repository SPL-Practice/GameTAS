extends Control

onready var fill = $fill

onready var sanity_over = $fill/over
onready var sanity_under = $fill/under
onready var update_tween = $updater

export var node_name = "player"

onready var rand = RandomNumberGenerator.new()
onready var noise = OpenSimplexNoise.new()

onready var NOISE_SHAKE_STRENGTH: float = 20.0
onready var NOISE_SHAKE_SPEED: float = 10.0

onready var SHAKE_DECAY: float = 5.0

var shake_strength: float = 0.0
var noise_i: float = 0.0

onready var health = get_parent().get_parent().get_parent().get_parent().get_node(node_name).health

func apply_shake():
	shake_strength = NOISE_SHAKE_STRENGTH

func _ready():
	health.connect("value_updated", self, "_on_health_updated")
	health.connect("max_health_updated", self, "_on_max_health_updated")
	health.connect("damage", self, "_on_damage")
	_on_max_health_updated(health.max_health)
	_on_health_updated(health.max_health)

func _on_health_updated(value):
	sanity_over.value = value
	update_tween.interpolate_property(sanity_under, "value", sanity_under.value, value, 0.25, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0.25)
	update_tween.start()
	
func _on_damage():
	apply_shake()
	

func _process(delta):
	shake_strength = lerp(shake_strength, 0, SHAKE_DECAY * delta)
	self.rect_position = get_noise_offset(delta)

func _on_max_health_updated(value):
	sanity_over.max_value = value
	sanity_under.max_value = value

func get_noise_offset(delta: float):
	noise_i += delta * NOISE_SHAKE_SPEED
	
	return Vector2(
		noise.get_noise_2d(1, noise_i) * shake_strength,
		noise.get_noise_2d(100, noise_i) * shake_strength
	)
