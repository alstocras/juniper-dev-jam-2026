extends RigidBody2D;
var generating: bool = false
var costTimer: float = 5.0

var potentialSpins: Array = [0.5, 1.5]

func _physics_process(delta: float) -> void:
	var buildings = Global.buildingMap
	if not generating:
		if Global.totalFermions >= 10:
			var myPos = buildings.local_to_map(global_position)
			if buildings.get_cell_source_id(myPos) == 1:
				Global.totalFermions -= 10
				generating = true
				costTimer = 5.0
				$AnimatedSprite2D.play("generate")
	else:
		var spin = potentialSpins.pick_random();
		Global.energyAvailable += 5 * spin * delta
		costTimer -= delta
		if costTimer <= 0:
			generating = false
			$AnimatedSprite2D.stop()
