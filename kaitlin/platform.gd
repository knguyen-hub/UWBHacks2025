extends StaticBody2D

func _ready():
	pass
	#modulate = Color(Color.MEDIUM_PURPLE, 0.7)
	
func _process(delta):
	if global.is_dragging:
		visible= false
	else:
		visible = false
