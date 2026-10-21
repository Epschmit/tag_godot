extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	GameData.players.append("Soldier")
	GameData.WASD = "Soldier"
	
	$".".queue_free()
	$"../Option2".queue_free()
	$"../Option3".queue_free()
	
