
extends RigidBody2D

const speed_x = -500

func _integrate_forces(state):
	state.set_linear_velocity(Vector2(speed_x,0))
	if get_global_pos().x < -256:
		queue_free()
	pass