
extends Particles2D

func _ready():
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	var angle = PI + get_node("../../../fox").get_rot()
	set_rot(angle)
	print(angle,"    ",get_param(0))
	set_param(0, -(rad2deg(angle) + 90))
	pass
