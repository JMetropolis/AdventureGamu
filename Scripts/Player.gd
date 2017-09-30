extends KinematicBody2D

var velocity = Vector2()
var inputVec = Vector2()
export var speed = 5
export var drag = 5




func _ready():
	
	pass
	
func _fixed_process(delta):
	
	if Input.is_action_pressed("player_right") and inputVec.x != -1:
		inputVec.x = 1
	elif Input.is_action_pressed("player_left"):
		inputVec.x = -1
	else:
		inputVec.x = 0
	
	if Input.is_action_pressed("player_down") and inputVec.y != -1:
		inputVec.y = 1
	elif Input.is_action_pressed("player_up"):
		inputVec.y = -1
	else:
		inputVec.y = 0
	
	velocity -= velocity * GetFriction() * delta
	velocity += inputVec * GetAcceleration() * delta
	
	move(velocity *delta)
	pass

func GetFriction():
	return drag
	
func GetAcceleration():
	return speed * drag