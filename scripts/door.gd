extends Area2D
var is_open: bool = false
@onready var door_animation = $door_animation
@onready var collision = $collision
@onready var door = $Door

func ready():
	var lever = $"Lever"
	lever.lever_hit.connect(_on_lever_hit)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Interact"):
		print("spacebar")
		if Lever.player_in_range:
			door_animation.play("open")

func _on_lever_hit():
	door_animation.play("open")
	collision_layer = 2
