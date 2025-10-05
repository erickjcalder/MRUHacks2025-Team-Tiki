extends Node2D

var cutscene_active
var OPENING_CUTSCENE = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'ddelta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if cutscene_active:
		$player.ToggleMovement($CutsceneHandler.CutsceneCheck())
	#if Input.is_action_just_pressed("Test_cutscene"):
		#cutscene_active = true
		#$CutsceneHandler.SceneChanger(1)
		#$player.ToggleMovement(false)
		
