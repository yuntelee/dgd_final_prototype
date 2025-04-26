extends CharacterBody2D 

const SPEED = 30

@export var player: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D 
@onready var audio_player := $AudioStreamPlayer2D

func _physics_process(_delta: float) -> void:
	var next_pos = nav_agent.get_next_path_position()
	var dir = (next_pos - global_position).normalized()  
	velocity = dir * SPEED
	move_and_slide()

func make_path() -> void:
	nav_agent.target_position = player.global_position 

func _on_timer_timeout() -> void:
	make_path()

func _on_area_2d_body_entered(_body: Node2D) -> void:
	if _body.name == "Player":
		get_tree().call_deferred("reload_current_scene")
