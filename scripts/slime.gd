extends Node2D

var SPEED = 60
var DIRECTION = 1

@onready var right_ray_cast: RayCast2D = $RightRayCast2D
@onready var left_ray_cast: RayCast2D = $LeftRayCast2D


func _process(delta: float) -> void:
	position.x += SPEED * DIRECTION * delta

	if right_ray_cast.is_colliding():
		DIRECTION = -1
		get_node("AnimatedSprite2D").set_deferred("flip_h", true)
	
	if left_ray_cast.is_colliding():
		DIRECTION = 1
		get_node("AnimatedSprite2D").set_deferred("flip_h", false)
