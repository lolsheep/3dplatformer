class_name Fall extends State

var jump_buf = 0.0
var jump_buf_time = 0.1

var coyote_time = 0.1
var coyote_time_timer = 0.0

func enter() -> void:
	jump_buf = 0.0
	coyote_time_timer = coyote_time
func input(e):
	if Input.is_action_just_pressed("jump"):
		jump_buf = jump_buf_time
		if coyote_time_timer > 0:
			return States.Jump
		
	return States.Null
	
func physics_process(delta) -> int:
	
	jump_buf -= delta
	coyote_time_timer -= delta
		
	player.direction = Vector3(Input.get_action_strength("right") - Input.get_action_strength("left"),
		0,
		Input.get_action_strength("backward") - Input.get_action_strength("forward")).rotated(Vector3.UP, player.h_rot).normalized()
	#player.velocity.y = player.direction * player.speed
	
	if player.is_on_floor():
		if jump_buf > 0:
			return States.Jump
		if not player.direction:
			return States.Idle
		else:
			return States.Walk
	else:
		player.velocity.y -= player.gravity * 3.0 * delta
	player.move_and_slide()
	return States.Null
