extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if GameData.players.size() < 2:
		$".".disabled = true
	else:
		$".".disabled = false

	


func _on_button_up() -> void:
	$Sprite2D.visible = true


func _on_button_down() -> void:
	$Sprite2D.visible = false
	await get_tree().create_timer(.2).timeout
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	
