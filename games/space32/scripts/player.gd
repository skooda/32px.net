extends KinematicBody2D

var bullet = preload("res://scenes/bullet.tscn")

const min_x = 4
const max_x = 28
const min_y = 3
const max_y = 28

onready var sprite:AnimatedSprite = get_node("Sprite")

var last_frame = 0
var step_duration = 0.03 # second

var last_shoot = 0
export var shoot_period = 0.5 # seconds
var pos = Vector2(12.5, 17.5)


func shoot():
	if last_shoot < shoot_period:
		return
	
	last_shoot = 0
	var b1 = bullet.instance()
	var b2 = bullet.instance()
	
	b1.position = position + Vector2(+3,0)
	b2.position = position + Vector2(-3,0)

	get_tree().current_scene.add_child(b1)
	get_tree().current_scene.add_child(b2)

func step():
	if Input.is_action_pressed("left") and pos[0] > min_x:
		pos[0] -= 1
		sprite.set_animation("left")
	elif Input.is_action_pressed("right") and pos[0] < max_x:
		pos[0] += 1
		sprite.set_animation("right")
	else:
		sprite.set_animation("default")
		
	if Input.is_action_pressed("up") and pos[1] > min_y:
		pos[1] -= 1
	if Input.is_action_pressed("down") and pos[1] < max_y:
		pos[1] += 1
	if Input.is_action_pressed("shoot"):
		shoot()

func _process(delta):
	last_frame += delta
	last_shoot += delta
	if last_frame > step_duration:
		last_frame = 0
		step()
		
	position = pos
