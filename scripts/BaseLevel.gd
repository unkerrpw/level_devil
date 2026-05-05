extends Node2D

@onready var player_spawn = $PlayerSpawn
var player_scene = preload("res://scenes/Player.tscn")
var player_instance = null

func _ready():
	spawn_player()

func spawn_player():
	player_instance = player_scene.instantiate()
	player_instance.position = player_spawn.position
	player_instance.add_to_group("player")
	add_child(player_instance)
	player_instance.died.connect(_on_player_died)
	player_instance.level_complete.connect(_on_level_complete)

func _on_player_died():
	await get_tree().create_timer(0.8).timeout
	GameManager.restart_level()

func _on_level_complete():
	await get_tree().create_timer(0.5).timeout
	GameManager.next_level()
