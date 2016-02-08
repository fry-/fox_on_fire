
extends RigidBody2D

func _integrate_forces(state):
	state.set_linear_velocity(Vector2(global.speed_x,0))
	if get_global_pos().x < -256:
		queue_free()
	pass