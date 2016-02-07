
extends Node2D

var segment = load("res://terrain/segment_creator.tscn")
var segment_current
var terrain
const MAX_CHILDS = 5

func _ready():
	terrain = get_node("terrain")
	set_fixed_process(true)
	pass

func _fixed_process(delta):
	
	if terrain.get_child_count() < MAX_CHILDS:
		segment_current = segment.instance()
		terrain.add_child(segment_current)
	
	var child_id = terrain.get_children()[0]
	if child_id.get_child_count() == 0:
		global.position_start = terrain.get_children()[4].get_node("pointer").get_global_pos()
		child_id.queue_free()
	pass
