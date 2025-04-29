extends Area2D

@onready var game_manager = %GameManager
@onready var audio_player = $AudioStreamPlayer2D
@onready var collision_shape = $CollisionShape2D
@onready var sprite = $AnimatedSprite2D

func _on_body_entered(_body: Node2D) -> void:
	# Prevent further collisions (deferred so it won’t error during physics queries)
	collision_shape.set_deferred("disabled", true)
	sprite.visible = false

	# Detach the audio player from the coin so it can keep playing after the coin is removed
	remove_child(audio_player)
	get_tree().current_scene.add_child(audio_player)
	audio_player.play()

	game_manager.add_point()
	queue_free()
