extends Control

onready var sanity_over = $fill/over
onready var sanity_under = $fill/under
onready var update_tween = $updater

export var node_name = "player"

onready var health = get_parent().get_parent().get_parent().get_parent().get_node(node_name).health

func _ready():
	health.connect("value_updated", self, "_on_health_updated")
	health.connect("max_health_updated", self, "_on_max_health_updated")
	_on_max_health_updated(health.max_health)
	_on_health_updated(health.max_health)

func _on_health_updated(value):
	sanity_over.value = value
	update_tween.interpolate_property(sanity_under, "value", sanity_under.value, value, 0.25, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0.25)
	update_tween.start()
	
func _on_max_health_updated(value):
	sanity_over.max_value = value
	sanity_under.max_value = value
