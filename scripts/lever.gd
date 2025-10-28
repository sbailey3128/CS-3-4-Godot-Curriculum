extends Area2D
var right = true
var player_in_range = false
signal lever_hit
func ready():
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Interact"):
		player_interact()


func play_animation(reverse: bool = false) -> void:
	if right:
		$AnimatedSprite2D.play("left")
		right = false
	else:
		$AnimatedSprite2D.play("right")
		right = true


func player_interact():
	if player_in_range:
		emit_signal("lever_hit")
		play_animation()
		print("player hit lever")


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		player_in_range = true
		print("player in range")
	else:
		pass


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		player_in_range = false
	else:
		pass
