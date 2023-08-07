extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
var health = 10
var right = true
@export var speed = 40
const DIRECTION_RIGHT = 1
const DIRECTION_LEFT = -1
var direction = Vector2(DIRECTION_RIGHT, 1)

func set_direction(hor_direction):
	if hor_direction == 0:
		hor_direction = DIRECTION_RIGHT # default to right if param is 0
	var hor_dir_mod = hor_direction / abs(hor_direction) # get unit direction
	apply_scale(Vector2(hor_dir_mod * direction.x, 1)) # flip
	direction = Vector2(hor_dir_mod, direction.y) # update direction

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	if Input.is_action_pressed("right"):
		_animated_sprite.play("walkright")
		set_direction(DIRECTION_RIGHT)
	elif Input.is_action_pressed("left"):
			_animated_sprite.play("walkright")
			set_direction(DIRECTION_LEFT)
	elif Input.is_action_pressed("up"):
			_animated_sprite.play("walkright")
	elif Input.is_action_pressed("down"):
			_animated_sprite.play("walkright")
	else:
			_animated_sprite.stop()

func _physics_process(delta):
	get_input()
	move_and_slide()
	update_health()

func update_health():
	var healthBar = $health_bar
	healthBar.value = health
	
	if health >= 100:
		healthBar.visible = false
	else:
		healthBar.visible = true

func _on_regen_timer_timeout():
	if health < 100:
		health += 2.5
		if health > 100:
			health = 100
	if health <= 0:
		health = 0
