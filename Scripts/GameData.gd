extends Node
var players:=[]

var WASD = null
var ARROWS = null
var JIL = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print("Players =", str(players))
	print("ARROWS =", str(ARROWS))
	print("WASD =", str(WASD))
	print("JIL =", str(JIL))
