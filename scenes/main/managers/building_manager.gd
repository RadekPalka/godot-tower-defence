class_name BuildingManager
extends Node2D

@export var tile_map_layer : TileMapLayer = null
const TOWER_GROUP = "TOWER_GROUP"
const IS_BUILDABLE : String = "buildable"
const TILE_SIZE = 64
var used_tiles : Array[Vector2i] =[]
func place_tower(cell_position : Vector2i, tower_packed_scene : PackedScene) -> void:
	if not check_valid_tower_placement(cell_position) or not tower_packed_scene:
		return
	used_tiles.append(cell_position)
	var tower : Node2D = tower_packed_scene.instantiate()
	tower.global_position = cell_position * TILE_SIZE
	get_tree().current_scene.add_child(tower)
	
	tower.add_to_group(TOWER_GROUP)

func check_valid_tower_placement(cell_position : Vector2i) -> bool:
	var cell_data = tile_map_layer.get_cell_tile_data(cell_position)
	return not used_tiles.has(cell_position) and cell_data and cell_data.get_custom_data(IS_BUILDABLE)
	
	
