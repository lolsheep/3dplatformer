class_name Walk extends State

func enter() -> void:
	pass

func input(e):

	if e.is_action_pressed("jump") and player.is_on_floor():
		return States.Jump
	return States.Null
	
func physics_process(delta):

	if not player.is_on_floor():
		return States.Fall

	player.direction = Vector3(Input.get_action_strength("right") - Input.get_action_strength("left"),
	0,
	Input.get_action_strength("backward") - Input.get_action_strength("forward")).rotated(Vector3.UP, player.h_rot).normalized()
	player.movement_speed = player.walk_speed
	
	player.move_and_slide()
	return States.Null
