extends Node2D

func _process(delta: float) -> void:
	$VBoxContainer.position.y -= 25 * delta;
	
	$VBoxContainer/Stats.text = str(Global.totalIron) + " Fe, " + str(Global.totalBosons) + " bosons, " + str(Global.totalFermions) + " fermions, " + str(Global.energyProduced) + " eV"
