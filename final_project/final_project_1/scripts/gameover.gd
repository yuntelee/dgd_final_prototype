extends Node2D

func _on_return_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	# If you don't have a main menu, change to your first level instead:
	# get_tree().change_scene_to_file("res://scenes/level1.tscn")
