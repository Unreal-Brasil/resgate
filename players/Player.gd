extends KinematicBody2D

export (int) var run_speed = 100
export (int) var jump_speed = -400
export (int) var gravity = 1200

onready var anim_sprite = get_node("AnimatedSprite")

var velocity = Vector2()
var jumping = false


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
		anim_sprite.play("jump")
	
	if(right):
		velocity.x += run_speed
		anim_sprite.flip_h = false
		anim_sprite.play("run")

	if(left):
		velocity.x -= run_speed
		anim_sprite.flip_h = true
		anim_sprite.play("run")
	
	if(!left and !right and !jump):
		anim_sprite.play("idle")
	
