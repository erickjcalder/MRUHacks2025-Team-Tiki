extends Node

var cutscene_active
var OPENING_CUTSCENE = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cutscene_active = true
	$CutsceneHandler.SceneChanger(OPENING_CUTSCENE)
	$room/player.ToggleMovement(false)

# Called every frame. 'ddelta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if cutscene_active:
		$room/player.ToggleMovement($CutsceneHandler.CutsceneCheck())
	#if Input.is_action_just_pressed("Test_cutscene"):
		#$CutsceneHandler.SceneChanger(1)
