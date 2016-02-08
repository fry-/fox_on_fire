
extends RigidBody2D


var speed_y = -500

# gravity scale of the rigid body
const GRAVITY_NORMAL = 10
const GRAVITY_FLY = 5

# former states
var button_jump_old = false
var button_dash_old = false
var contact_count_old

var jumps_left = 2
var time = 0.0

#func _ready():
#	pass

func _integrate_forces(state):
	
	# input events
	var button_jump = Input.is_action_pressed("jump")
	var button_dash = Input.is_action_pressed("dash")
	var contact_count = state.get_contact_count()
	
	var current_velocity = state.get_linear_velocity()
	if (contact_count == 1) and (contact_count_old == 0):
		jumps_left = 2
	
	if button_jump and (button_jump_old == false) and jumps_left: # first jump button press
		current_velocity.y = speed_y
		button_jump_old = button_jump
		jumps_left -= 1
	elif button_jump and (state.get_contact_count() == 0): # keep jump button pressed
		time += state.get_step()
		current_velocity.y = get_linear_velocity().y
		set_gravity_scale(GRAVITY_FLY)
	else: # no jump pressed
		current_velocity.y = get_linear_velocity().y
		time = 0.0
		button_jump_old = button_jump
		set_gravity_scale(GRAVITY_NORMAL)
		
	
	# safe former states
	button_jump_old = button_jump
	button_dash_old = button_dash
	contact_count_old = contact_count
	
	current_velocity.x = -get_global_pos().x * 100
	state.set_linear_velocity(current_velocity)
