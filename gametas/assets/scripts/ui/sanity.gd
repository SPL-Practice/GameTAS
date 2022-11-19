extends Control

onready var sanity_over = $over
onready var sanity_under = $under
onready var update_tween = $updater

onready var character = get_parent().get_parent().get_node("player")

func _ready():
	character.connect("health_updated", self, "_on_health_updated")
	character.connect("max_health_updated", self, "_on_max_health_updated")
	_on_max_health_updated(character.max_health)
	_on_health_updated(character.max_health)

func _on_health_updated(health):
	sanity_over.value = health
	update_tween.interpolate_property(sanity_under, "value", sanity_under.value, health, 0.25, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0.25)
	update_tween.start()
	
func _on_max_health_updated(max_health):
	sanity_over.max_value = max_health
	sanity_under.max_value = max_health
