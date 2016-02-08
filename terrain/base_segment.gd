
extends StaticBody2D

func _ready():
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	set_pos(get_pos()+ Vector2(global.speed_x*delta,0))
	if get_global_pos().x < -256:
		queue_free()
	pass