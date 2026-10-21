extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_pressed() -> void:
	GameData.players.append("Fiend")
	GameData.ARROWS = "Fiend"
	
	$".".queue_free()
	$"../Option1Arrows".queue_free()
	$"../Option2Arrows".queue_free()
