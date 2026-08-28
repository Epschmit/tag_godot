extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".visible = false
	$Return_To_Main.disabled


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_esc"):
		$".".visible = true
		$Return_To_Main.disabled = false
		get_tree().paused = true
		
		
func _on_button_button_down() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	


func _on_cancel_button_pressed() -> void:
	$".".visible = false
	$Return_To_Main.disabled = true
	get_tree().paused = false
	
