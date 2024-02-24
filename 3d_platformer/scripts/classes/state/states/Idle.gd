class_name Idle extends State

func enter() -> void:

	pass
	
func exit():
	pass
	
func input(e):

	if player.is_on_floor() and e.is_action_pressed("jump"):
		print("Asd")
		return States.Jump
	if (e.is_action_pressed("backward") or e.is_action_pressed("backward")
	or e.is_action_pressed("left") or e.is_action_pressed("right")):
		return States.Walk
		
	return States.Null
	
func physics_process(delta):

	return States.Null
