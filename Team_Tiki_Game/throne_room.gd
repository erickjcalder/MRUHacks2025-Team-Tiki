extends Node2D

var cutscene_active

var OBTAINED_KEY = 1

@onready var item_key = $Key

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
	var Items = load_from_file()
	if "ID" in Items:
		id_button.text = "ID"
	if "poster" in Items:
		poster_button.text = "Signed Poster"
	if "key" in Items:
		remove_child(item_key)
		key_button.text = "Gambler's Key"
	if "gravestone" in Items:
		gravestone_button.text = "Gravestone"
	if "dress" in Items:
		dress_button.text = "Old Dress"
	if "cookie" in Items:
		cookie_button.text = "Homemade Cookie"
	item_key.connect("key_picked_up", Callable(self, "_on_key_picked_up"))
	
# Called every frame. 'ddelta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !$CutsceneHandler.TextActive:
		$player.ToggleMovement(true)	
		
func _on_key_picked_up():
	$CutsceneHandler.SceneChanger(OBTAINED_KEY)
	$player.ToggleMovement(false)
	key_button.text = "Gambler's Key"
	var CurrentItems = load_from_file()
	save_to_file(CurrentItems + "\nkey")
