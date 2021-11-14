extends actor

export var stomp_impulse: = 1000.0

func _on_enemyDetector_body_entered(_body: PhysicsBody2D) -> void:
	die()

func _on_enemyDetector_area_entered(_area: Area2D) -> void:
	_velocity = calculate_stomp_velocity(_velocity, stomp_impulse)

func _physics_process(delta: float) -> void:
	var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction: = get_direction()
	_velocity = calculate_move_velocity(_velocity, terminal_velocity, direction, delta, is_jump_interrupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)

func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if (Input.is_action_just_pressed("jump") or Input.is_action_pressed("jump")) and is_on_floor() else 0.0
	)

func calculate_move_velocity(
	linear_velocity: Vector2, 
	terminal_velocity: Vector2,
	direction: Vector2,
	delta: float,
	jump_interrupted: bool
) -> Vector2:
	var _velocity: = linear_velocity
	_velocity.x = terminal_velocity.x * direction.x
	if direction.y != 0.0:
		_velocity.y = terminal_velocity.y * direction.y
	if jump_interrupted:
		_velocity.y = 0.0
	return _velocity
	
func calculate_stomp_velocity(linear_velocity: Vector2, impulse: float) -> Vector2:
	var out: = linear_velocity
	out.y = -impulse
	return out

func die() -> void:
	PlayerData.deaths += 1
	PlayerData.score = PlayerData.end_of_level_score
	queue_free()
