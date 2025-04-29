extends Camera2D

var shake_time: float = 0.0
var shake_strength: float = 0.0
var original_position: Vector2

func _ready() -> void:
	original_position = position

func _process(delta: float) -> void:
	if shake_time > 0.0:
		var offset = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized() * randf_range(0, shake_strength)
		position = original_position + offset
		shake_time -= delta
	else:
		position = original_position

func shake(duration: float, strength: float) -> void:
	shake_time = duration
	shake_strength = strength
	original_position = position  # תמיד שומר את המיקום רגע לפני רעידה
