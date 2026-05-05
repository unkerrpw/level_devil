extends AnimatableBody2D

@export var move_distance = 200.0
@export var speed = 100.0
@export var direction = Vector2.RIGHT
@export var reverse_on_trigger = false  # Troll: reverses when player jumps on it

var start_pos: Vector2
var target_pos: Vector2
var going_forward = true

func _ready():
	start_pos = position
	target_pos = position + direction.normalized() * move_distance

func _physics_process(delta):
	if going_forward:
		position = position.move_toward(target_pos, speed * delta)
		if position.distance_to(target_pos) < 2:
			going_forward = false
	else:
		position = position.move_toward(start_pos, speed * delta)
		if position.distance_to(start_pos) < 2:
			going_forward = true

func _on_player_landed():
	if reverse_on_trigger:
		going_forward = !going_forward
		speed *= 3  # Внезапно быстрее!
		await get_tree().create_timer(1.0).timeout
		speed /= 3
