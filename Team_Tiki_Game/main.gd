extends Node

var cutscene_active
var OPENING_CUTSCENE = 0
#
@onready var id = $ID
@onready var id_button = $"inventory-menu/Button"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cutscene_active = true
	$CutsceneHandler.SceneChanger(OPENING_CUTSCENE)
	$Bedroom/player.ToggleMovement(false)
	
	id.connect("id_picked_up", Callable(self, "_on_id_picked_up"))

# Called every frame. 'ddelta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if cutscene_active:
		$Bedroom/player.ToggleMovement($CutsceneHandler.CutsceneCheck())
	#if Input.is_action_just_pressed("Test_cutscene"):
		#$CutsceneHandler.SceneChanger(1)
		

func _on_id_picked_up():
	id_button.text = "ID"
