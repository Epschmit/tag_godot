extends Node
var is_paused = false
@export var time_left = 200
var timeout = false
var loser := []

const ORC = preload("res://Scenes/Orcs/orc.tscn")
var orc_instance = ORC.instantiate()

const ORC2 = preload("res://Scenes/Orcs/orc_2.tscn")
var orc2_instance = ORC2.instantiate()

const ORC3 = preload("res://Scenes/Orcs/orc_3.tscn")
var orc3_instance = ORC3.instantiate()
###########################################################
const SOLDIER = preload("res://Scenes/Soldiers/soldier.tscn")
var soldier_instance = SOLDIER.instantiate()

const SOLDIER2 = preload("res://Scenes/Soldiers/soldier_2.tscn")
var soldier2_instance = SOLDIER2.instantiate()

const SOLDIER3 = preload("res://Scenes/Soldiers/soldier_3.tscn")
var soldier3_instance = SOLDIER3.instantiate()
#############################################################
const FIEND = preload("res://Scenes/Fiends/fiend.tscn")
var fiend_instance = FIEND.instantiate()

const FIEND2 = preload("res://Scenes/Fiends/fiend_2.tscn")
var fiend2_instance = FIEND2.instantiate()

const FIEND3 = preload("res://Scenes/Fiends/fiend_3.tscn")
var fiend3_instance = FIEND3.instantiate()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
			#orc_instance.position.x = 0
			#orc_instance.position.y = 0
			#$Players.add_child(orc_instance)
	if GameData.ARROWS == "Fiend":
		fiend_instance.position.x = 0
		fiend_instance.position.y = 0
		$Players.add_child(fiend_instance)
	elif GameData.ARROWS == "Orc":
		orc_instance.position.x = 0
		orc_instance.position.y = 0
		$Players.add_child(orc_instance)
	elif GameData.ARROWS == "Soldier":
		soldier_instance.position.x = 0
		soldier_instance.position.y = 0
		$Players.add_child(soldier_instance)
	else:
		pass
	
	if GameData.WASD == "Fiend":
		fiend2_instance.position.x = 80
		fiend2_instance.position.y = 0
		$Players.add_child(fiend2_instance)
	elif GameData.WASD == "Orc":
		orc2_instance.position.x =80
		orc2_instance.position.y = 0
		$Players.add_child(orc2_instance)
	elif GameData.WASD == "Soldier":
		soldier2_instance.position.x = 80
		soldier2_instance.position.y = 0
		$Players.add_child(soldier2_instance)
	else:
		pass
	
	if GameData.JIL == "Fiend":
		fiend3_instance.position.x = -80
		fiend3_instance.position.y = 0
		$Players.add_child(fiend3_instance)
	elif GameData.JIL == "Orc":
		orc3_instance.position.x =-80
		orc3_instance.position.y = 0
		$Players.add_child(orc3_instance)
	elif GameData.JIL == "Soldier":
		soldier3_instance.position.x = -80
		soldier3_instance.position.y = 0
		$Players.add_child(soldier3_instance)
	else:
		pass
	
	
	var it_at_start = $Players.get_children().pick_random()
	it_at_start.is_it = true
	
	##################################################################################
	
	
	
	######################################################################################
	
	$Label.text = str(time_left)
	while (timeout == false):
		await get_tree().create_timer(1).timeout
		if is_paused:
			continue
		
		time_left -= 1
		$Label.text = str(time_left)
		
		if (time_left <= 0):
			var player1 = $Players.get_child(0)
			var player2 = $Players.get_child(1)
			var player3 = $Players.get_child(2)
			var player4 = $Players.get_child(3)
				
				
				
			if player1.is_it == true:
				$Label.text = (str(player1.name))
			elif player2.is_it == true:
				$Label.text = (str(player2.name))
			elif player3.is_it == true:
				$Label.text = (str(player3.name))
			elif player4.is_it == true:
				$Label.text = (str(player4.name))
			
			
			$Players.get_tree().paused = true
			if Input.is_action_just_pressed("ui_r"):
				
				get_tree().reload_current_scene()
			timeout = true
			
		#///////////////////////////////////////////////////////////////
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	pass
	

	
			
		
