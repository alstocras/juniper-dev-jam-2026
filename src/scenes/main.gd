extends Node2D;

var mousePos;
@onready var tMap = $TileMapLayer

func _process(delta: float) -> void:
	mousePos = tMap.get_local_mouse_position();
	if Input.is_action_just_pressed("placeObj"):
		if not tMap.get_cell_source_id(tMap.local_to_map(mousePos)) == 1:
			tMap.set_cell(tMap.local_to_map(mousePos), 1, Vector2i(0, 0), 1)
