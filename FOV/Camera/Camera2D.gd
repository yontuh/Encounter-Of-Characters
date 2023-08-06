extends Camera2D
#func _input(event):
#	if event is InputEventMouseButton:
#		if event.button_index 
#zoom = Vector2(1,1)
func _input(event):
	if event.is_action_pressed("scroll_up"):
		zoom += Vector2(.1,.1)
		
	if event.is_action_pressed("scroll_down"):
		zoom -= Vector2(.1,.1)
