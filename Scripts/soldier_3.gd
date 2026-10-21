extends CharacterBody2D
#test
@export var is_it := false
var can_double_jump := true
@export var SPEED = 210.0
@export var JUMP_VELOCITY = -380.0 #OG 370

var right_key = "ui_l"
var left_key = "ui_j"
var up_key = "ui_i"

func _ready() -> void:
	pass
#////////////////////////////////////////////////////////////////////////////////
func _process(delta: float) -> void:
	pass
	
	if is_on_floor():
		can_double_jump = true
	
		#//////////////////////////////////////////////////////////////////////////////
	if is_it == true:
		$Sprite2D.visible = true
		SPEED = 230
	elif is_it == false:
		SPEED = 210
		$Sprite2D.visible = false

#///////////////////////////////////////////////////////////////////////////

func _physics_process(delta: float) -> void:
	

	
	#//////////////////////////////////////////////////////////////////////////
	if Input.is_action_just_pressed(left_key):
		$Soldier3_Animations.flip_h = true
	if Input.is_action_just_pressed(right_key):
		$Soldier3_Animations.flip_h = false
	#///////////////////////////////////////////////////////////////////////////////////////////
	if is_on_floor():
		
			
		if Input.is_action_pressed(left_key) || Input.is_action_pressed(right_key):
			$Soldier3_Animations.play("Run")
		elif is_on_floor():
			$Soldier3_Animations.play("Idle")
	
	#///////////////////////////////////////////////////////////////////////////////////////////////////////////
	if not is_on_floor():
		
		
		velocity += get_gravity() * delta
		
	

	# Handle jump.
	if Input.is_action_just_pressed(up_key) and  can_double_jump == true:
		$Soldier3_Animations.play("Jump")
		
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


func _on_soldier_3_hurtbox_area_entered(area: Area2D) -> void:
	


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

	
