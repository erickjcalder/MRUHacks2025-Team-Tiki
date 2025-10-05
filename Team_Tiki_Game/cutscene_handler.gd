extends Container

var black = Color(0,0,0)
var red = Color(255,0,0)
var blue = Color(0, 0, 255)
var white = Color(255, 255, 255)
var green = Color(0, 255, 0)
var purple = Color(255, 0, 255)

var SIZE_SMALL = 10
var SIZE_MEDIUM = 21
var SIZE_LARGE = 40
var SIZE_HUGE = 70

var OpeningCutscene = [["Hello Mr. Doe", SIZE_HUGE, red],
["Who are you? What do you want from me?", SIZE_MEDIUM, black],
["You can call me Tikiman\n and what I want is quite simple", SIZE_LARGE, red],
["Hidden in this castle are 5 items closely LINKED to one another in intangible ways", SIZE_LARGE, red], 
["I need you to find these items and uncover the LINKS between them", SIZE_LARGE, red],
["And why exactly should I do that?", SIZE_MEDIUM, black],
["If you comply, I will let you leave peacefully", SIZE_LARGE, red],
["And if I refuse?", SIZE_MEDIUM, black],
["I'll still let you leave. But only after you've used that laptop to play one entire game of league of legends", SIZE_MEDIUM, red],
["!!!!!!!!!!!!!!", SIZE_HUGE, black], 
["better get a move on, this guy means business", SIZE_SMALL, black],
["end", 1, white]]

var GotKey = [["Oh nice A conveniently placed key!", SIZE_MEDIUM, black],
["The handle has four gems in the shapes of card suits", SIZE_MEDIUM, black],
["DIAMONDS, HEARTS", SIZE_HUGE, red],
["CLUBS and SPADES", SIZE_HUGE, black],
["I bet the person that had this made was a real high roller", SIZE_MEDIUM, black],
["Obtained: Old Key", SIZE_HUGE, blue],
["end", 1, white]]

var GotPoster = [["Oh?", SIZE_MEDIUM, black],
["Looks like there's something written on the inside of this poster", SIZE_MEDIUM, black],
["To my biggest fan Mr. Tiki: keep following your dream of owning your own escape room business", SIZE_LARGE, green],
["sincerely, Greggary J Maddison", SIZE_HUGE, green],
["Obtained: Signed Poster", SIZE_HUGE, blue],
["end", 1, white]]

var GotDress = [["This has GOT to be important", SIZE_MEDIUM, black],
["Certainly nothing else in here that seems obtainable", SIZE_MEDIUM, black],
["Obtained: Old Dress", SIZE_HUGE, blue],
["end", 1, white]]

var GotID = [["Looks like somebody dropped their wallet", SIZE_MEDIUM, black],
["There's an ID card inside, looks like it belongs to", SIZE_MEDIUM, black],
["Greggary J Maddison", SIZE_HUGE, green],
["Obtained: ID Card", SIZE_HUGE, blue],
["end", 1, white]]

var GotCookies = [["Wow! A whole plate of chocolate chip cookies!", SIZE_MEDIUM, black],
["I'd love to eat some but I really don't want to play league", SIZE_MEDIUM, black],
["I'll just stuff them in my bag for later", SIZE_MEDIUM, black],
["Obtained: Homemade Cookies", SIZE_HUGE, blue],
["end", 1, white]]

var GotGravestone = [["\"Here lies the great honourable", SIZE_MEDIUM, black],
["Jimothy Terwilliger Huxley", SIZE_HUGE, purple],
["may his exploits never be forgotten\"", SIZE_MEDIUM, black],
["Rest in peace Jimothy...", SIZE_MEDIUM, black],
["...", SIZE_HUGE, black],
["Obtained: Jimothy's Gravestone", SIZE_HUGE, blue],
["end", 1, white]]

var TextActive = false
var index = 0
var CurrentScript = []

var DIALOG = 0
var FONT_SIZE = 1
var FONT_COLOR = 2

func SceneChanger(SceneNumber: int) -> void:
	match SceneNumber:
		0: 
			CurrentScript = OpeningCutscene
		1:
			CurrentScript = GotKey
		2:
			CurrentScript = GotPoster
		3:
			CurrentScript = GotDress
	TextActive = true
	$TextBox/Text.text = CurrentScript[index][DIALOG]
	$TextBox/Text.label_settings.set("font_size", CurrentScript[index][FONT_SIZE])
	$TextBox/Text.label_settings.set("font_color", CurrentScript[index][FONT_COLOR])
	$TextBox.show()
	
func CutsceneCheck() -> bool:
	if TextActive == false:
		return true
	else:
		return false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$TextBox.hide()

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
