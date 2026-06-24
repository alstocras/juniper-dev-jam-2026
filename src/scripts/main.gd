extends Node2D;

var mousePos;
var activeCell;
@onready var tMap = $Buildings;
@onready var terrain = $Terrain;

var extractorCost: float = 20;
@onready var warner = $CanvasLayer/Warner

var electricExtractorCost: float = 20;
var tunnelerExtractorCost: float = 20;

var ironTurbineCost: float = 40;
var bosonTurbineCost: float = 40;
var fermionTurbineCost: float = 40;

@onready var bosonLabel = $CanvasLayer/Bosons;
var bosonCount: float;
var bosonSpins: Array = [0, 1, 2]

@onready var fermionLabel = $CanvasLayer/Fermions;
var fermionCount: float;
var fermionSpins: Array = [0.5, 1.5]

@onready var ironLabel = $CanvasLayer/Iron;
var ironCount: float;

@onready var energyLabel = $CanvasLayer/Energy

@onready var help = $CanvasLayer/HelpMenu;

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
	
				
	bosonLabel.text = str(int(bosonCount))
	fermionLabel.text = str(int(fermionCount))
	
	if Input.is_action_pressed("removeObj"):
		tMap.erase_cell(activeCell)
		
		
	if Input.is_action_pressed("placeObj"):
			if ironCount >= extractorCost:
				tMap.set_cell(activeCell, 0, Vector2i(0, 0), 1);
				ironCount -= extractorCost;
					
	if Input.is_action_pressed("placeIronTurbine"):
		if ironCount >= ironTurbineCost:
				tMap.set_cell(activeCell, 1, Vector2i(0, 0), 2);
				ironCount -= ironTurbineCost;
	
	if Input.is_action_pressed("placeTunnelerExtractor"):
		if fermionCount >= tunnelerExtractorCost:
				tMap.set_cell(activeCell, 0, Vector2i(0, 0), 5);
				fermionCount -= tunnelerExtractorCost;
				
	if Input.is_action_pressed("placeElectricExtractor"):
		if bosonCount >= electricExtractorCost:
			tMap.set_cell(activeCell, 0, Vector2i(0, 0), 3);
			bosonCount -= electricExtractorCost
				
	if Input.is_action_pressed("placeBosonTurbine"):
		if bosonCount >= bosonTurbineCost:
				tMap.set_cell(activeCell, 1, Vector2i(0, 0), 4);
				bosonCount -= bosonTurbineCost;
				
	if Input.is_action_pressed("placeFermionTurbine"):
		if fermionCount >= fermionTurbineCost:
				tMap.set_cell(activeCell, 1, Vector2i(0, 0), 6);
				fermionCount -= fermionTurbineCost;
				
	if Input.is_action_pressed("mineIron") and terrain.get_cell_source_id(activeCell) == 3:
		ironCount += 0.1;
		
	if Input.is_action_just_pressed("openHelp"):
		help.show();
	elif Input.is_action_just_pressed("closeHelp"):
		help.hide();
	
	ironLabel.text = str(int(ironCount));
	energyLabel.text = str(roundi(Global.energyAvailable)) + " eV";
	Global.totalIron = ironCount;
	Global.totalFermions = fermionCount;
	Global.totalBosons = bosonCount;
	
	
