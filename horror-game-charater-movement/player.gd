extends Area2D
signal hit
@export var speed = 250
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO  
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x > 0:
		$AnimatedSprite2D.animation = "walk_right"
		$AnimatedSprite2D.flip_h = false
	elif velocity.x < 0:
		$AnimatedSprite2D.animation = "walk_left"
		$AnimatedSprite2D.flip_h = false
	elif velocity.y > 0:
		$AnimatedSprite2D.animation = "walk_forward"
		$AnimatedSprite2D.flip_v = false
	elif velocity.y < 0:
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
