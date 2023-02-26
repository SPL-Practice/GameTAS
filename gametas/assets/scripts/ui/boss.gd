extends "res://assets/scripts/ui/sanity.gd"

func _ready():
	var boss = health.get_parent()
	boss.connect("defeat", self, "_on_defeat")

func _on_defeat():
	self.hide()
