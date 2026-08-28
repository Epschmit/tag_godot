extends Node

var time_left = 2
var timeout = false
var loser := []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var it_at_start = $Players.get_children().pick_random()
	it_at_start.is_it = true
	
	
	######################################################################################
	
	$Label.text = str(time_left)
	while (timeout == false):
		time_left -= 1
		$Label.text = str(time_left)
		await get_tree().create_timer(1).timeout
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
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	pass
	
			
		
