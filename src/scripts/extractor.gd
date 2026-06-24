extends RigidBody2D;

var tMap = Global.buildingMap;
var terrain = Global.terrainMap;

var bosonSpins: Array = [0, 1, 2]

func _process(delta: float) -> void:
	var myCell = tMap.local_to_map(global_position)
	if terrain.get_cell_source_id(myCell) == 2 and tMap.get_cell_source_id(myCell) == 0:
		var spin = bosonSpins.pick_random();
		Global.totalBosons += (0.1 * spin);
		if not $AnimatedSprite2D.is_playing():
			$AnimatedSprite2D.play("extract");
	if terrain.get_cell_source_id(myCell) == 3 and tMap.get_cell_source_id(myCell) == 0:
		Global.totalIron += 0.1;
		if not $AnimatedSprite2D.is_playing():
			$AnimatedSprite2D.play("extract");
	
