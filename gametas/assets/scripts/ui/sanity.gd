extends Control

onready var sanity_over = $fill/over
onready var sanity_under = $fill/under
onready var updater = $updater

onready var shaker = $shaker

export (String) var node_name = "player"
export (int) var depth = 4

var health

func _search(child):
	for node in depth:
		child = child.get_parent()
	return child

func _ready():
	health = _search(self).get_node(node_name).health
	health.connect("value_updated", self, "_on_health_updated")
	health.connect("max_health_updated", self, "_on_max_health_updated")
	health.connect("damage", self, "_on_damage")
	_on_max_health_updated(health.max_health)
	_on_health_updated(health.max_health)

func _on_health_updated(value):
	sanity_over.value = value
	updater.interpolate_property(sanity_under, "value", sanity_under.value, value, 0.25, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0.25)
	updater.start()

func _on_max_health_updated(value):
	sanity_over.max_value = value
	sanity_under.max_value = value

func _on_damage():
	shaker.apply_shake()

func _process(delta):
	self.rect_position = shaker.shake(delta)
