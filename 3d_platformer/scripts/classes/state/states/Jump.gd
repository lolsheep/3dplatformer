class_name Jump extends State


func enter() -> void:
	
	player.velocity.y = 20


# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_process(delta):
	print("")
	if player.velocity.y > 0:
		return States.Fall
	
	#player.velocity.y += player.gravity * delta
	#player.direction = Input.get_axis("left","right")
	#if Input.is_action_just_released("jump"):
		#player.velocity.y *= 0.5
	#if player.direction:
		#player.velocity.x = player.direction * player.speed
	#player.move_and_slide()

	return States.Null
