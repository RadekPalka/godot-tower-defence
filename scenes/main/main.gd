class_name Main
extends Node2D

@export var tower_packed_scene : PackedScene = null
@onready var tile_map_layer: TileMapLayer = $TileMapLayer
@onready var hightlight_tile: HightLightTile = $HightlightTile

const IS_BUILDABLE : String = "buildable"
const TILE_SIZE = 64
var used_tiles : Array[Vector2i] =[]

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse"):
		var cell_position : Vector2i = tile_map_layer.local_to_map(tile_map_layer.get_local_mouse_position())
		
		var cell_data = tile_map_layer.get_cell_tile_data(cell_position)
		if used_tiles.has(cell_position) or not cell_data:
			return
		if cell_data and cell_data.get_custom_data(IS_BUILDABLE):
			place_tower(cell_position)
			used_tiles.append(cell_position)
		
func place_tower(position : Vector2i) -> void:
	if not tower_packed_scene:
		return
	var tower : Node2D = tower_packed_scene.instantiate()
	tower.global_position = position * TILE_SIZE
	add_child(tower)
