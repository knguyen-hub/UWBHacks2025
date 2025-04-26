extends StaticBody2D

func _ready():
	pass
	
func _process(delta):
	if global.is_dragging:
		scale = Vector2(1.1, 1.1)
	else:
		scale = Vector2(1, 1)
