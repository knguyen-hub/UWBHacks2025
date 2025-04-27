extends Node2D

var us_1heart = false 
var us_2heart = false 
var us_3heart = false 

func urban_sprawler(): 
	var us = $AnimatedSprite2D
	if (us_1heart): 
		us.play("1 heart")
	elif (us_2heart): 
		us.play("2 hearts")
	elif (us_3heart): 
		us.play("3 hearts")
