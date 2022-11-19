extends Area2D

export var step_duration = 0.02 # seconds
var last_frame = 0


func step():
	position[1] -= 1
	
	if position[1] < -5:
		queue_free()

	
func _process(delta):
	last_frame += delta
	if last_frame > step_duration:
		last_frame = 0
		step()
