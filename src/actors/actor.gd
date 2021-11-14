extends KinematicBody2D
class_name actor

const FLOOR_NORMAL: = Vector2.UP

export var terminal_velocity: = Vector2(300.0, 1000.0)
export var gravity: = 3000.0

var _velocity: = Vector2.ZERO

func _physics_process(delta: float) -> void:
	_velocity.y += gravity * delta
