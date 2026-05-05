extends Node

var current_level = 1
var total_levels = 12
var deaths = 0

const LEVELS = [
	"res://scenes/levels/Level01.tscn",
	"res://scenes/levels/Level02.tscn",
	"res://scenes/levels/Level03.tscn",
	"res://scenes/levels/Level04.tscn",
	"res://scenes/levels/Level05.tscn",
	"res://scenes/levels/Level06.tscn",
	"res://scenes/levels/Level07.tscn",
	"res://scenes/levels/Level08.tscn",
	"res://scenes/levels/Level09.tscn",
	"res://scenes/levels/Level10.tscn",
	"res://scenes/levels/Level11.tscn",
	"res://scenes/levels/Level12.tscn",
]

func load_level(level_num: int):
	current_level = level_num
	if level_num <= LEVELS.size():
		get_tree().change_scene_to_file(LEVELS[level_num - 1])

func next_level():
	if current_level < total_levels:
		load_level(current_level + 1)
	else:
		get_tree().change_scene_to_file("res://scenes/WinScreen.tscn")

func restart_level():
	deaths += 1
	load_level(current_level)

func go_to_menu():
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
