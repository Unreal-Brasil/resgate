extends KinematicBody2D

export (int) var run_speed = 100
export (int) var jump_speed = -400
export (int) var gravity = 1200

var velocity = Vector2()
var jumping = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	get_input()
	velocity.y += gravity * delta
	
	if(jumping and is_on_floor()):
		jumping = false
	
	velocity = move_and_slide(velocity, Vector2(0,-1))	

func get_input():
	velocity.x = 0
	
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	var jump = Input.is_action_pressed("ui_up")
	
	if(jump and is_on_floor()):
		jumping=true
		velocity.y = jump_speed
	
	if(right):
		velocity.x += run_speed

	if(left):
		velocity.x -= run_speed
		
		
		
