extends Node2D;

var mousePos;
var activeCell;
@onready var tMap = $Buildings;
@onready var terrain = $Terrain;

var extractorCost: float = 20;
@onready var warner = $CanvasLayer/Warner

var ironTurbineCost: float = 40;

@onready var bosonLabel = $CanvasLayer/Bosons;
var bosonCount: float;
var bosonSpins: Array = [0, 1, 2]

@onready var fermionLabel = $CanvasLayer/Fermions;
var fermionCount: float;
var fermionSpins: Array = [0.5, 1.5]

@onready var ironLabel = $CanvasLayer/Iron;
var ironCount: float;

func _ready() -> void:
	warner.hide();

func _process(delta: float) -> void:
	var lookrange = Global.lookRange;
	Global.buildingMap = tMap;
	Global.terrainMap = terrain;
	ironCount = Global.totalIron
	bosonCount = Global.totalBosons
	fermionCount = Global.totalFermions
	mousePos = tMap.get_local_mouse_position();
	activeCell = tMap.local_to_map(mousePos);
	
	for x in range(-lookrange, lookrange):
		for y in range(-lookrange, lookrange):
			if terrain.get_cell_source_id(Vector2i(x, y)) == 2 and tMap.get_cell_source_id(Vector2i(x, y)) == 0:
				var spin = bosonSpins.pick_random();
				bosonCount += (0.1 * spin);
			if terrain.get_cell_source_id(Vector2i(x, y)) == 1 and tMap.get_cell_source_id(Vector2i(x, y)) == 0:
				var spin = fermionSpins.pick_random();
				fermionCount += (0.1 * spin);
			if terrain.get_cell_source_id(Vector2i(x, y)) == 3 and tMap.get_cell_source_id(Vector2i(x, y)) == 0:
				ironCount += 0.1;
				
	bosonLabel.text = str(int(bosonCount))
	fermionLabel.text = str(int(fermionCount))
	
	if Input.is_action_pressed("removeObj"):
		if tMap.get_cell_source_id(activeCell) == 1:
			ironCount += extractorCost;
		tMap.erase_cell(activeCell)
		
		
	if Input.is_action_pressed("placeObj"):
			if ironCount >= extractorCost:
				tMap.set_cell(activeCell, 0, Vector2i(0, 0), 1);
				ironCount -= extractorCost;
					
	if Input.is_action_pressed("placeIronTurbine"):
		if ironCount >= ironTurbineCost:
				tMap.set_cell(activeCell, 1, Vector2i(0, 0), 2);
				ironCount -= ironTurbineCost;
				
				
	if Input.is_action_pressed("mineIron") and terrain.get_cell_source_id(activeCell) == 3:
		ironCount += 0.1;
	ironLabel.text = str((ironCount));
	Global.totalIron = ironCount;
	Global.totalFermions = fermionCount;
	Global.totalBosons = bosonCount;
	
	
