extends Node2D

var cutscene_active

var OBTAINED_COOKIE = 4
var OBTAINED_POSTER = 2

@onready var cookie = $Cookie
@onready var poster = $Poster

# Always needed because of how this disaster works
@onready var id_button = $"inventory-menu/Button"
@onready var cookie_button = $"inventory-menu/Button2"
@onready var dress_button = $"inventory-menu/Button3"
@onready var gravestone_button = $"inventory-menu/Button4"
@onready var key_button = $"inventory-menu/Button5"
@onready var poster_button = $"inventory-menu/Button6"

func save_to_file(content):
	var file = FileAccess.open("res://data/items.txt", FileAccess.WRITE)
	file.store_string(content)

func load_from_file():
	var file = FileAccess.open("res://data/items.txt", FileAccess.READ)
	var content = file.get_as_text()
	return content

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cookie.connect("cookie_picked_up", Callable(self, "_on_cookie_picked_up"))
	poster.connect("poster_picked_up", Callable(self, "_on_poster_picked_up"))
	var Items = load_from_file()
	if "ID" in Items:
		id_button.text = "ID"
	if "poster" in Items:
		poster_button.text = "Signed Poster"
		remove_child(poster)
	if "key" in Items:
		key_button.text = "Gambler's Key"
	if "gravestone" in Items:
		gravestone_button.text = "Gravestone"
	if "dress" in Items:
		dress_button.text = "Old Dress"
	if "cookie" in Items:
		remove_child(cookie)
		cookie_button.text = "Homemade Cookie"
	

# Called every frame. 'ddelta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !$CutsceneHandler.TextActive:
		$player.ToggleMovement(true)	
		
func _on_cookie_picked_up():
	$CutsceneHandler.SceneChanger(OBTAINED_COOKIE)
	$player.ToggleMovement(false)
	cookie_button.text = "Homemade Cookie"
	var CurrentItems = load_from_file()
	save_to_file(CurrentItems + "\ncookie")
	
func _on_poster_picked_up():
	$CutsceneHandler.SceneChanger(OBTAINED_POSTER)
	$player.ToggleMovement(false)
	poster_button.text = "Signed Poster"
	var CurrentItems = load_from_file()
	save_to_file(CurrentItems + "\nposter")		
