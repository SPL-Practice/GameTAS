extends Control

onready var sanity_over = $over
onready var sanity_under = $under
onready var update_tween = $updater

func _on_health_updated(health, amount):
	sanity_over.value = health
	update_tween.interpolate_property(sanity_under, "value", sanity_under.value, health, 0.4, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	update_tween.start()
	
func _on_max_health_updated(max_health):
	sanity_over.max_value = max_health
	sanity_under.max_value = max_health
