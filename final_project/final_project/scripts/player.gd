extends CharacterBody2D

const SPEED = 100
var dir : Vector2

func _physics_process(_delta: float) -> void:
	velocity = dir * SPEED
	move_and_slide()
	
func _unhandled_input(_event: InputEvent) -> void:
	dir.x = Input.get_axis("ui_left", "ui_right")
	dir.y = Input.get_axis("ui_up", "ui_down")
	dir = dir.normalized()

#
#func _on_lvl_2_switch_body_entered(_body: Node2D) -> void:
	#print("lvl2")
	##get_tree().change_scene_to_file("res://scenes/level_2.tscn")
	## get_tree().call_deferred("change_scene_to_file", "level_2.tscn")
