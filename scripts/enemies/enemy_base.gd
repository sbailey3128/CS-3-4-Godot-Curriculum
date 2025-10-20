extends npc


@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
var is_attacking = false
var cooldown = 1
var timer = cooldown




func _ready() -> void:
	super._ready()
	
	

func _physics_process(delta: float) -> void:
	if not is_attacking:
		super._physics_process(delta)
	else:
		timer -= delta
		if timer<0:
			attack()
			timer = cooldown
		
func attack():
	print("attacked the player")
	animated_sprite.play("attack_animation")
	await get_tree().create_timer(1).timeout
	if is_attacking:
		attack()
	else:
		animated_sprite.play("idle")



func _process(delta: float) -> void:
	pass


func _on_detection_radius_body_entered(body: Node2D) -> void:
	if body is Player:
		is_hostile = true


func _on_detection_radius_body_exited(body: Node2D) -> void:
	if body is Player:
		is_hostile = false


func _on_hit_radius_body_entered(body: Node2D) -> void:
	if body is Player:
		is_attacking = true
		attack()


func _on_hit_radius_body_exited(body: Node2D) -> void:
	if body is Player:
		is_attacking = false
