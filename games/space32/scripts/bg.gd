extends Sprite

var last_frame = 0
var step_duration = 0.03 # second
var pos = 0

func step():
	pos = (pos + 1) % 32
	position[1] = pos

func _process(delta):
	last_frame += delta
	if last_frame > step_duration:
		last_frame = 0
		step()
