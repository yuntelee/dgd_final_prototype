extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		# Get the current scene name
		var current_scene = get_tree().current_scene.name
		
		if current_scene == "Level1":
			# If we're in Level1, go to Level2
			get_tree().change_scene_to_file("res://scenes/level_2.tscn")
		elif current_scene == "Level2":
			# If we're in Level2, go to winstate
			get_tree().change_scene_to_file("res://scenes/winstate.tscn")
