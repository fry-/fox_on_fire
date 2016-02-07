
extends Node2D

# load the segments
var start = load("res://terrain/start_segment.tscn")
var mid = load("res://terrain/mid_segment.tscn")
var end = load("res://terrain/end_segment.tscn")

var segment_new
var segment_count = 0
var position_start = Vector2(64,320)

var direction
var gradient
var angle_start
var angle = 0
var segment_amount

const MAX_ANGLE = 30 # in degree
const SEGMENT_SIZE = 64 # in pixel

func _ready():
	randomize()
	# randomize direction and size of platform
	direction = randi() % 3 # create 3 different cases
	gradient = randi() % 2 # start gradient for curved platforms
	angle_start = randi() % 6 # in degree
	angle = angle_start
	segment_amount = 5 + randi() % 16 # 5 - 20 segments
	
	if gradient == 0:
		gradient = -1
	else:
		gradient = 1
	
	if direction == 0: # straight platform
		angle = 0
		angle_start = 0
		gradient = 0
		segment_creation(start)
		for i in range(1,segment_amount):
			segment_creation(mid)
		segment_creation(end)
	else:
		if direction == 1:
			angle *= -1
		segment_creation(start)
		for i in range(1,segment_amount):
			segment_creation(mid)
		segment_creation(end)
	
	new_startpoint()
	
	pass

func segment_creation(segment):
	segment_new = segment.instance()
	segment_new.set_pos(position_start)
	
	if MAX_ANGLE < abs(angle + (gradient * abs(angle_start))):
		gradient *= -1
		angle_start += 2 * gradient
	
	angle += gradient * abs(angle_start)
	segment_new.set_rot(-deg2rad(angle))
	angle_start += gradient
	add_child(segment_new)
	
	position_start.y += sin(deg2rad(angle)) * SEGMENT_SIZE
	position_start.x += cos(deg2rad(angle)) * SEGMENT_SIZE
	pass

func new_startpoint():
	position_start.x += 500
	get_node("position").set_pos(position_start)
	pass
