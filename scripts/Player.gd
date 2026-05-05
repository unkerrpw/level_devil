extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -500.0
const GRAVITY = 980.0

var is_dead = false
var jump_count = 0
var max_jumps = 1

signal died
signal level_complete

func _physics_process(delta):
	if is_dead:
		return
	
	# Gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		jump_count = 0
	
	# Touch controls handled by GameUI
	var direction = 0
	if Input.is_action_pressed("move_left"):
		direction = -1
	elif Input.is_action_pressed("move_right"):
		direction = 1
	
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	# Jump
	if Input.is_action_just_pressed("jump") and jump_count < max_jumps:
		velocity.y = JUMP_VELOCITY
		jump_count += 1
	
	move_and_slide()
	
	# Fall death
	if position.y > 1200:
		die()

func move_horizontal(direction: float):
	velocity.x = direction * SPEED

func do_jump():
	if jump_count < max_jumps:
		velocity.y = JUMP_VELOCITY
		jump_count += 1

func die():
	if is_dead:
		return
	is_dead = true
	emit_signal("died")
	# Death animation
	var tween = create_tween()
	tween.tween_property(self, "modulate", Color.RED, 0.1)
	tween.tween_property(self, "scale", Vector2(1.3, 0.7), 0.1)
	tween.tween_property(self, "modulate", Color.TRANSPARENT, 0.3)
	tween.tween_callback(queue_free)

func complete_level():
	emit_signal("level_complete")
