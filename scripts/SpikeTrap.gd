extends Node2D

@export var trigger_distance = 150.0
@export var activate_delay = 0.0  # 0 = instant troll

var player = null
var activated = false
var spikes_up = false

func _ready():
	$Spikes.visible = false
	$CollisionShape2D.disabled = true

func _process(_delta):
	if activated:
		return
	player = get_tree().get_first_node_in_group("player")
	if player == null:
		return
	var dist = position.distance_to(player.position)
	if dist < trigger_distance:
		activated = true
		_trigger()

func _trigger():
	await get_tree().create_timer(activate_delay).timeout
	spikes_up = true
	$Spikes.visible = true
	$CollisionShape2D.disabled = false
	# Kill player if touching
	var tween = create_tween()
	tween.tween_property($Spikes, "position:y", $Spikes.position.y - 20, 0.1)

func _on_kill_area_body_entered(body):
	if body.is_in_group("player"):
		body.die()
