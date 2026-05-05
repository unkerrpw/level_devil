extends StaticBody2D

# Выглядит как стена, но исчезает когда игрок прыгает на неё
@export var fake_type = "floor"  # floor, wall, ceiling
var triggered = false

func _on_body_entered(body):
	if body.is_in_group("player") and not triggered:
		triggered = true
		_reveal_fake()

func _reveal_fake():
	$CollisionShape2D.disabled = true
	var tween = create_tween()
	tween.tween_property(self, "modulate", Color(1, 0.3, 0.3, 0.5), 0.15)
	tween.tween_property(self, "modulate:a", 0.0, 0.2)
	await tween.finished
	queue_free()
