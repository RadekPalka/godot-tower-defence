class_name HightLightTile
extends Node2D

const TILE_SIZE : int = 64

func _process(delta: float) -> void:
	follow_mouse_position()

func follow_mouse_position()-> void:
	var mouse_position : Vector2i = get_global_mouse_position() / TILE_SIZE
	
	position = mouse_position * TILE_SIZE
