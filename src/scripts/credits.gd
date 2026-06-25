extends Node2D

func _process(delta: float) -> void:
	$VBoxContainer.position.y -= 25 * delta;
	
	$VBoxContainer/Stats.text = str(roundi(Global.totalIron)) + " Fe, " + str(roundi(Global.totalBosons)) + " bosons, " + str(roundi(Global.totalFermions)) + " fermions"
