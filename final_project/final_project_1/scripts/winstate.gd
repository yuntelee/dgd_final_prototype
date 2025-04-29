extends Node2D

@onready var tilemap = $"../TileMap" # Adjust the path to your TileMap

func _ready():
	# Center UI elements on the screen
	$Label.position = Vector2(get_viewport_rect().size.x / 2 - $Label.size.x / 2, 
							 get_viewport_rect().size.y / 2 - 100)
	$Button.position = Vector2(get_viewport_rect().size.x / 2 - $Button.size.x / 2,
							  get_viewport_rect().size.y / 2 + 100)

func _on_button_pressed():
	# Return to main menu or first level
	get_tree().change_scene_to_file("res://scenes/level1.tscn")
	# Alternatively, return to main menu if you have one
	# get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _physics_process(delta):
	# Check if player is on a green tile
	var player_pos = global_position
	var tile_pos = tilemap.local_to_map(tilemap.to_local(player_pos))
	var tile_id = tilemap.get_cell_source_id(0, tile_pos)
	
	# Assuming green tiles have a specific ID (replace 3 with your green tile ID)
	if tile_id == 3: # Replace with your green tile ID
		get_tree().change_scene_to_file("res://scenes/winstate.tscn")
