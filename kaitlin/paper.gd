extends StaticBody2D

var was_clicked = false
var mouse_in = false

func _ready():
	pass
	
	
func flip_horiz():
	scale.x = -1

func _process(delta):
	if mouse_in:
		scale = Vector2(1.1, 1.1)
		if Input.is_action_just_pressed('click'):
			was_clicked = true
			print('clicked')
	else:
		scale = Vector2(1, 1)
	if global.is_dragging or mouse_in:
		scale = Vector2(1.1, 1.1)
	else:
		scale = Vector2(1, 1)
"""
func _on_mouse_shape_entered(shape_idx: int) -> void:
	scale = Vector2(1.1, 1.1)
	mouse_in = true

func _on_mouse_shape_exited(shape_idx: int) -> void:
	scale = Vector2(1, 1)
	mouse_in = false
"""

func _on_mouse_entered() -> void:
	scale = Vector2(1.1, 1.1)
	mouse_in = true


func _on_mouse_exited() -> void:
	scale = Vector2(1, 1)
	mouse_in = false
