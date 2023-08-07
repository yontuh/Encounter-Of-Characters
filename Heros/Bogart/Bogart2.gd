extends CharacterBody2D

var health = 10

@export var speed = 40

var target = position

func _input(event):
	if event.is_action_pressed("right_click"):
		target = get_global_mouse_position()

func _physics_process(delta):
	velocity = position.direction_to(target) * speed
	# look_at(target)
	if position.distance_to(target) > 10:
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
