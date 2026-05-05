extends CanvasLayer

var player = null
var left_held = false
var right_held = false

func _process(_delta):
	player = get_tree().get_first_node_in_group("player")
	if player == null:
		return
	if left_held:
		player.move_horizontal(-1)
	elif right_held:
		player.move_horizontal(1)
	else:
		player.move_horizontal(0)

func _on_left_button_down():
	left_held = true

func _on_left_button_up():
	left_held = false

func _on_right_button_down():
	right_held = true

func _on_right_button_up():
	right_held = false

func _on_jump_button_pressed():
	if player:
		player.do_jump()
