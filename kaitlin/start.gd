extends Node2D


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://kaitlin/test2.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_help_button_pressed() -> void:
	get_tree().change_scene_to_file("res://kaitlin/help.tscn")
