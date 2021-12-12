extends KinematicBody2D

export var speed = 400
var screen_size
var up = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2()  # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	elif Input.is_action_pressed("ui_down"):
		velocity.y += 1
	elif Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		#get node
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	position += velocity * delta
	# prevent char from leaving the screen
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	if velocity.y > 0:
		$AnimatedSprite.animation = "down"
		$AnimatedSprite.flip_h = false
		up = false
	elif velocity.y < 0:
		$AnimatedSprite.animation = "up"
		$AnimatedSprite.flip_h = false
		up = true
	elif velocity.x < 0:
		$AnimatedSprite.animation = "left"
		$AnimatedSprite.flip_h = false
	elif velocity.x > 0:
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.flip_h = false
	elif velocity.y == 0:
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = false
		

  
