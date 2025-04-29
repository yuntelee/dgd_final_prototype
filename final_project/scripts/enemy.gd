extends CharacterBody2D

const SPEED = 30
const MAX_HITS = 3 # אחרי שלוש פגיעות מפסידים

@export var player: Node2D
@onready var nav_agent := $NavigationAgent2D
@onready var audio_player := $AudioStreamPlayer2D

var hit_count: int = 0

func _physics_process(_delta: float) -> void:
	var next_pos = nav_agent.get_next_path_position()
	var dir = (next_pos - global_position).normalized()
	velocity = dir * SPEED
	move_and_slide()

func make_path() -> void:
	nav_agent.target_position = player.global_position

func _on_timer_timeout() -> void:
	make_path()

func _on_area_2d_body_entered(_body: Node) -> void:
	if _body.is_in_group("Player"):
		print("Player touched! Trying to shake screen...")

		var cam = null
		if get_tree().current_scene.has_node("Camera2D"):
			cam = get_tree().current_scene.get_node("Camera2D")
		elif get_tree().current_scene.has_node("Gameplay/Camera2D"):
			cam = get_tree().current_scene.get_node("Gameplay/Camera2D")

		if cam and cam.has_method("shake"):
			cam.shake(0.2, 8.0)
			print("Shake triggered!")
		else:
			print("Camera2D not found or doesn't have shake method!")

		hit_count += 1
		print("Player hit count:", hit_count)

		if hit_count >= MAX_HITS:
			await get_tree().create_timer(0.3).timeout
			var gm = get_tree().current_scene.get_node("GameManager")
			if gm:
				gm.game_over()
			else:
				print("GameManager not found!")
