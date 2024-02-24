class_name Player
extends CharacterBody3D

@export var state_manager : StateManager 
@onready var camera_root : Node3D = $camera_root
@onready var mesh : Node3D = $Capsule_Basic_Player

const speed = 5.0
const jump_velocity = 50
var friction = 0.2
var movement_speed = 0
var walk_speed = 5
var vertical_velocity = 0
var acceleration = 6 
var direction = Vector3.FORWARD
var gravity = 9.0
var h_rot : float = 0.0
func _ready():
	state_manager.init(self)
func _unhandled_input(event):
	state_manager.input(event)
	
func _physics_process(delta):
	
	#
	#if not is_on_floor():
		##print(velocity)
		#velocity.y -= gravity  * delta
#
	#if (Input.is_action_pressed("forward") or Input.is_action_pressed("backward") or 
	#Input.is_action_pressed("left") or Input.is_action_pressed("right")):
		#
		#h_rot = camera_root.cam_h.basis.get_euler().y
		#direction = Vector3(Input.get_action_strength("right") - Input.get_action_strength("left"),
		#0,
		#Input.get_action_strength("backward") - Input.get_action_strength("forward")).rotated(Vector3.UP, h_rot).normalized()
		#movement_speed = walk_speed
	#else:
		#movement_speed = 0
		#
	state_manager.physics_process(delta)
	#print(direction)
		#
	#velocity = lerp(velocity, direction * movement_speed, delta * acceleration)
	mesh.rotation.y = lerp_angle(mesh.rotation.y, atan2(direction.x,direction.z), delta * acceleration)
	#move_and_slide()

