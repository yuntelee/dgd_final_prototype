extends Area2D

@onready var game_manager = %GameManager
@onready var audio_player = $AudioStreamPlayer2D

func _on_body_entered(_body: Node2D) -> void:
	audio_player.play()
	game_manager.add_point()
	queue_free()
