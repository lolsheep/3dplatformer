extends Node3D

var cam_rot_h : float = 0.0
var cam_rot_v : float = 0.0
var cam_h_sensitivity =  0.5
var cam_v_sensitivity = 0.5
var cam_h_acceleration = 10
var cam_v_acceleration = 10
var cam_v_max = 20
var cam_v_min = -55

@onready var cam_h = $hoz
@onready var cam_v = $hoz/vert
@onready var cam = $hoz/vert/Camera3D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
func _unhandled_input(event):
	
	if event is InputEventMouseMotion:
		cam_rot_h += -event.relative.x * cam_h_sensitivity
		cam_rot_v += -event.relative.y * cam_v_sensitivity
		
func _physics_process(delta):
	
	cam_rot_v = clamp(cam_rot_v, cam_v_min, cam_v_max)
	
	cam_h.rotation_degrees.y = lerp(cam_h.rotation_degrees.y, cam_rot_h, delta * cam_h_acceleration)
	cam_v.rotation_degrees.x = lerp(cam_v.rotation_degrees.x, cam_rot_v, delta * cam_v_acceleration)
	
