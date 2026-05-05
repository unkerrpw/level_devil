## DisappearingFloor.gd
## Пол исчезает когда игрок наступает
extends StaticBody2D

@export var delay = 0.5
@export var visible_again_time = 3.0
var triggered = false

func _on_area_entered(area):
	if triggered:
		return
	triggered = true
	await get_tree().create_timer(delay).timeout
	# Shake before disappear
	var tween = create_tween()
	tween.tween_property(self, "position:x", position.x + 5, 0.05)
	tween.tween_property(self, "position:x", position.x - 5, 0.05)
	tween.tween_property(self, "position:x", position.x, 0.05)
	tween.tween_callback(_disappear)

func _disappear():
	$CollisionShape2D.disabled = true
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 0.2)
	await get_tree().create_timer(visible_again_time).timeout
	$CollisionShape2D.disabled = false
	tween = create_tween()
	tween.tween_property(self, "modulate:a", 1.0, 0.3)
	triggered = false
