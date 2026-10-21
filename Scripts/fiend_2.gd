extends CharacterBody2D
#test
@export var is_it := false
var can_double_jump := true
@export var SPEED = 200.0
@export var JUMP_VELOCITY = -420.0

var left_key := "ui_a"
var right_key := "ui_d"
var up_key := "ui_w"


#////////////////////////////////////////////////////////////////////////////////
func _process(_delta: float) -> void:
	pass
	
	if is_on_floor():
		can_double_jump = true
	
		#//////////////////////////////////////////////////////////////////////////////
	if is_it == true:
		$Sprite2D.visible = true
		SPEED = 220
	elif is_it == false:
		$Sprite2D.visible = false
		SPEED = 200

#///////////////////////////////////////////////////////////////////////////

func _physics_process(delta: float) -> void:
	

	
	#//////////////////////////////////////////////////////////////////////////
	if Input.is_action_just_pressed(left_key):
		$Fiend2_Animations.flip_h = true
	if Input.is_action_just_pressed(right_key):
		$Fiend2_Animations.flip_h = false
	#///////////////////////////////////////////////////////////////////////////////////////////
	if is_on_floor():
		
			
		if Input.is_action_pressed(left_key) || Input.is_action_pressed(right_key):
			$Fiend2_Animations.play("Run")
		elif is_on_floor():
			$Fiend2_Animations.play("Idle")
	
	#///////////////////////////////////////////////////////////////////////////////////////////////////////////
	if not is_on_floor():
		
		
		velocity += get_gravity() * delta
		
	

	# Handle jump.
	if Input.is_action_just_pressed(up_key) and  can_double_jump == true:
		$Fiend2_Animations.play("Jump")
		
		velocity.y = JUMP_VELOCITY
		if not is_on_floor():
			if Input.is_action_just_pressed(up_key):
				can_double_jump = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis(left_key, right_key)
	if direction:
		
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
#//////////////////////////////////////////////////////////////////////////////////////


func _on_fiend_2_hurtbox_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
	
	var other_player = area.get_parent()
	
	
	if $".".is_it == true:
		await get_tree().create_timer(.0001).timeout
		if other_player.is_it == true:
			return
			
		elif other_player.is_it == false:
			$".".is_it = false
			$Sprite2D.visible = false
			other_player.is_it = true
			
	elif $".".is_it == false:
		return



	
