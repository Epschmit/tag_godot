extends CharacterBody2D
#test
@export var is_it := false
var can_double_jump := true
var SPEED = 200.0
var JUMP_VELOCITY = -350.0

#////////////////////////////////////////////////////////////////////////////////
func _process(delta: float) -> void:
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
	if Input.is_action_just_pressed("ui_j"):
		$Fiend_Animations.flip_h = true
	if Input.is_action_just_pressed("ui_l"):
		$Fiend_Animations.flip_h = false
	#///////////////////////////////////////////////////////////////////////////////////////////
	if is_on_floor():
		
			
		if Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_l"):
			$Fiend_Animations.play("Run")
		elif is_on_floor():
			$Fiend_Animations.play("Idle")
	
	#///////////////////////////////////////////////////////////////////////////////////////////////////////////
	if not is_on_floor():
		
		
		velocity += get_gravity() * delta
		
	

	# Handle jump.
	if Input.is_action_just_pressed("ui_i") and  can_double_jump == true:
		$Fiend_Animations.play("Jump")
		
		velocity.y = JUMP_VELOCITY
		if not is_on_floor():
			if Input.is_action_just_pressed("ui_i"):
				can_double_jump = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_j", "ui_l")
	if direction:
		
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
#//////////////////////////////////////////////////////////////////////////////////////


func _on_fiend_hurtbox_area_entered(area: Area2D) -> void:
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



	
