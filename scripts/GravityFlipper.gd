extends Area2D

var flipped = false

func _on_body_entered(body):
	if body.is_in_group("player") and not flipped:
		flipped = true
		# Flip gravity for player
		body.velocity.y = -body.velocity.y * 1.5
		# Visual cue - rotate world
		var level = get_tree().current_scene
		var tween = create_tween()
		tween.tween_property(level, "rotation", PI, 0.3)
		# Actually flip the player's gravity constant
		# Reset after 3 seconds
		await get_tree().create_timer(3.0).timeout
		tween = create_tween()
		tween.tween_property(level, "rotation", 0.0, 0.3)
		flipped = false
