class_name StateManager extends Node

@export var idle : Node
@export var walk : Node
@export var jump : Node
@export var fall : Node

@onready var states = {
	State.States.Idle : idle,
	State.States.Walk : walk,
	State.States.Jump : jump,
	State.States.Fall : fall
}
var current : State

func switch_state(n: int) -> void:
	if current:
		current.exit()
	current = states[n]
	current.enter()

func init(player: Player) -> void:
	for c in get_children():
		c.player = player
	
	switch_state(State.States.Idle)

func physics_process(delta: float) -> void:
	var new = current.physics_process(delta)
	if new != State.States.Null:
		switch_state(new)

func input(e: InputEvent) -> void:
	var new = current.input(e)
	if new != State.States.Null:
		switch_state(new)

	
