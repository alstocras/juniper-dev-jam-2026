extends Node2D;

var mousePos;
var activeCell;
@onready var tMap = $Buildings;
@onready var terrain = $Terrain;
@onready var bosonLabel = $CanvasLayer/Bosons;
var bosonCount: float;
var bosonSpins: Array = [0, 1, 2]

func _process(delta: float) -> void:
	mousePos = tMap.get_local_mouse_position();
	activeCell = tMap.local_to_map(mousePos);
	if Input.is_action_just_pressed("placeObj"):
		if not tMap.get_cell_source_id(activeCell) == 1:
			tMap.set_cell(activeCell, 0, Vector2i(0, 0), 1)
	for x in range(-10, 10):
		for y in range(-10, 10):
			if terrain.get_cell_source_id(Vector2i(x, y)) == 2 and tMap.get_cell_source_id(Vector2i(x, y)) == 0:
				var spin = bosonSpins.pick_random();
				bosonCount += (0.1 * spin);
				print(spin)
	if Input.is_action_just_pressed("removeObj"):
		tMap.erase_cell(activeCell)
	bosonLabel.text = "bosons: " + str(round(bosonCount))
