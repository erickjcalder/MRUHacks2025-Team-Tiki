extends CharacterBody2D
signal hit
@export var speed = 400
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var input_velocity = Vector2.ZERO  
	
	if Input.is_action_pressed("move_right"):
		input_velocity.x += 1
	if Input.is_action_pressed("move_left"):
		input_velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		input_velocity.y += 1
	if Input.is_action_pressed("move_up"):
		input_velocity.y -= 1
	
	if input_velocity.length() > 0:
		input_velocity = input_velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	velocity = input_velocity
	
	move_and_slide()
	
	position = position.clamp(Vector2.ZERO, Vector2(800, 800))
	
	if input_velocity.x > 0:
		$AnimatedSprite2D.animation = "walk_right"
		$AnimatedSprite2D.flip_h = false
	elif input_velocity.x < 0:
		$AnimatedSprite2D.animation = "walk_left"
		$AnimatedSprite2D.flip_h = false
	elif input_velocity.y > 0:
		$AnimatedSprite2D.animation = "walk_forward"
		$AnimatedSprite2D.flip_v = false
	elif input_velocity.y < 0:
		$AnimatedSprite2D.animation = "walk_back"
		$AnimatedSprite2D.flip_v = false

func _on_body_entered(_body):
	hide()
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
