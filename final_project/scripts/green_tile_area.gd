extends Area2D

@export var is_win_zone: bool = true

func _on_body_entered(body):
	if body.is_in_group("Player") and is_win_zone:
		# Transition to win scene
		get_tree().change_scene_to_file("res://scenes/winstate.tscn")
