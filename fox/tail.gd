
extends Particles2D

func _ready():
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	var angle = get_rot()
	set_param(0, -(rad2deg(angle) + 80))
	pass
