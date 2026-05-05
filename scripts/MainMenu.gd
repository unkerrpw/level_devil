extends Control

func _ready():
	# Animate title
	$VBox/Title.modulate = Color.TRANSPARENT
	var tween = create_tween()
	tween.tween_property($VBox/Title, "modulate", Color.WHITE, 0.8)
	tween.tween_property($VBox/Subtitle, "modulate", Color.WHITE, 0.5)

func _on_play_pressed():
	GameManager.load_level(1)

func _on_quit_pressed():
	get_tree().quit()
