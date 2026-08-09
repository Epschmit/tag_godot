extends CharacterBody2D
#test

var can_double_jump := true
const SPEED = 200.0
const JUMP_VELOCITY = -350.0

#////////////////////////////////////////////////////////////////////////////////
func _process(delta: float) -> void:
	pass
	
	if is_on_floor():
		can_double_jump = true

#///////////////////////////////////////////////////////////////////////////

func _physics_process(delta: float) -> void:
	
	#///////////////////////////////////////////////////////////////////////////////////////////
	if is_on_floor():
		if Input.is_action_just_pressed("ui_left"):
			$Soldier_Animations.flip_h = true
		if Input.is_action_just_pressed("ui_right"):
			$Soldier_Animations.flip_h = false
			
		if Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_right"):
			$Soldier_Animations.play("Run")
		elif is_on_floor():
			$Soldier_Animations.play("Idle")
	
	#///////////////////////////////////////////////////////////////////////////////////////////////////////////
	if not is_on_floor():
		
		
		velocity += get_gravity() * delta
		
	

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and  can_double_jump == true:
		$Soldier_Animations.play("Jump")
		
		velocity.y = JUMP_VELOCITY
		if not is_on_floor():
			if Input.is_action_just_pressed("ui_up"):
				can_double_jump = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
