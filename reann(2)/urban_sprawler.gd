extends Node2D

var us_1heart = false 
var us_2heart = false 
var us_3heart = false 

func flash():
	hide()
	await get_tree().create_timer(0.3).timeout
	show()
	await get_tree().create_timer(0.3).timeout
	hide()
	await get_tree().create_timer(0.3).timeout
	show()

func urban_sprawler(): 
	var us = $AnimatedSprite2D
	if (us_3heart): 
		us.play("3 hearts")
	elif (us_2heart): 
		us.play("2 hearts")
	elif (us_1heart): 
		us.play("1 heart")
