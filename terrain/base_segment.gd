
extends Node2D

const SPEED_X = 500

func _ready():
	set_fixed_process(true)
	pass

func _fixed_proces(delta):
	set_global_pos(-SPEED_X * delta)
	pass