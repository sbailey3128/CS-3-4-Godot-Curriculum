extends npc

@onready var sprite: Sprite2D = $Sprite2D
var is_attacking = false
var Player


func _ready() -> void:
	super._ready()
	
	

func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	pass

func _attack_process(delta: float) -> void:
	if is_attacking == true:
		get_tree().create_timer(1).timeout
		Player.change_health(5)

func _on_detection_radius_body_entered(body: Node2D) -> void:
	if body is Player:
		is_hostile = true


func _on_detection_radius_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
