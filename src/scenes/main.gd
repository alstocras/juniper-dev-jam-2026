extends Node2D;

var basicExtractor = preload("res://src/scenes/extractor.tscn");
var mousePos;
var obj;

func _process(delta: float) -> void:
	mousePos = $TileMapLayer.get_local_mouse_position();
	if Input.is_action_just_pressed("placeObj"):
		$TileMapLayer.set_cell($TileMapLayer.local_to_map(mousePos), 1, Vector2i(0, 0), 0)
