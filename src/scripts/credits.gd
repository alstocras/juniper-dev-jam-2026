extends Node2D

func _process(delta: float) -> void:
	$VBoxContainer.position.y -= 25 * delta;
	
	$VBoxContainer/Stats.text = str(roundi(Global.totalIron)) + " iron, " + str(roundi(Global.totalBosons)) + " bosons, " + str(roundi(Global.totalFermions)) + " fermions"
	
	if Input.is_action_just_pressed("menu"):
		get_tree().change_scene_to_file("res://src/scenes/main-menu.tscn");
