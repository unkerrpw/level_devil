extends Control

func _ready():
	$DeathCount.text = "You died " + str(GameManager.deaths) + " times!"
	
	var tween = create_tween()
	tween.tween_property($Title, "modulate", Color.WHITE, 1.0)

func _on_menu_pressed():
	GameManager.deaths = 0
	GameManager.go_to_menu()

func _on_replay_pressed():
	GameManager.deaths = 0
	GameManager.load_level(1)
