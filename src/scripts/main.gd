extends Node2D;

var mousePos;
var activeCell;
var lookrange := 40
@onready var tMap = $Buildings;
@onready var terrain = $Terrain;

@onready var bosonLabel = $CanvasLayer/Bosons;
var bosonCount: float;
var bosonSpins: Array = [0, 1, 2]

@onready var fermionLabel = $CanvasLayer/Fermions;
var fermionCount: float;
var fermionSpins: Array = [0.5, 1.5]

func _process(delta: float) -> void:
	mousePos = tMap.get_local_mouse_position();
	activeCell = tMap.local_to_map(mousePos);
	
	for x in range(-lookrange, lookrange):
		for y in range(-lookrange, lookrange):
			if terrain.get_cell_source_id(Vector2i(x, y)) == 2 and tMap.get_cell_source_id(Vector2i(x, y)) == 0:
				var spin = bosonSpins.pick_random();
				bosonCount += (0.1 * spin);
	bosonLabel.text = str(round(bosonCount))
	
	for x in range(-lookrange, lookrange):
		for y in range(-lookrange, lookrange):
			if terrain.get_cell_source_id(Vector2i(x, y)) == 1 and tMap.get_cell_source_id(Vector2i(x, y)) == 0:
				var spin = fermionSpins.pick_random();
				fermionCount += (0.1 * spin);
	fermionLabel.text = str(round(fermionCount))
	
	if Input.is_action_pressed("removeObj"):
		tMap.erase_cell(activeCell)
		
	if Input.is_action_pressed("placeObj"):
		if not tMap.get_cell_source_id(activeCell) == 1:
			tMap.set_cell(activeCell, 0, Vector2i(0, 0), 1)
