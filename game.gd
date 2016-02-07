
extends Node2D

var segment = load("res://terrain/segment_creator.tscn")
var terrain
const MAX_CHILDS = 5

func _ready():
	terrain = get_node("terrain")
	
	pass


