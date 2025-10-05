extends Container

var black = Color(0,0,0)
var red = Color(255,0,0)
var blue = Color(0, 0, 255)

var SIZE_MEDIUM = 21

var OpeningCutscene = [["Placeholder 1", 69, blue],
["Placeholder 2", SIZE_MEDIUM, red],
["Placeholder 3", 40, black],
["Placeholder 4", SIZE_MEDIUM, black], 
["Placeholder 5", 30, red],
["Placeholder 6", SIZE_MEDIUM, black],
["end", 69, red]]

var TextActive = false
var index = 0
var CurrentScript = []

var DIALOG = 0
var FONT_SIZE = 1
var FONT_COLOR = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CurrentScript = OpeningCutscene
	$TextBox/Text.text = CurrentScript[index][DIALOG]
	$TextBox/Text.label_settings.set("font_size", CurrentScript[index][FONT_SIZE])
	$TextBox/Text.label_settings.set("font_color", CurrentScript[index][FONT_COLOR])
	# DEBUG LINE, REMOVE LATER
	TextActive = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if TextActive:
		if Input.is_action_just_pressed("advance_text"):
			index += 1
			if CurrentScript[index][DIALOG] == "end":
				$TextBox.hide()
				TextActive = false
				index = 0
				pass
			else:
				$TextBox/Text.text = CurrentScript[index][DIALOG]
				$TextBox/Text.label_settings.set("font_size", CurrentScript[index][FONT_SIZE])
				$TextBox/Text.label_settings.set("font_color", CurrentScript[index][FONT_COLOR])
	else:
		pass
