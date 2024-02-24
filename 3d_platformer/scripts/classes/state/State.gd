class_name State extends Node

enum States {
	Null,
	Idle,
	Walk,
	Jump,
	Fall
}

var player : Player

func enter() -> void:
	pass
func exit() -> void:
	pass

func input(e: InputEvent) -> int:
	return States.Null
func process(delta: float) -> int:
	return States.Null
func physics_process(delta: float) -> int:
	return States.Null
