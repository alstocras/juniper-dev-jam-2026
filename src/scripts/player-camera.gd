extends Camera2D;

var zoomMultiplier: Vector2 = Vector2(0.5, 0.5);

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("zoomIn"):
		zoomMultiplier = Vector2(0.8, 0.8);
	if Input.is_action_just_pressed("zoomOut"):
		zoomMultiplier = Vector2(1.2, 1.2);
	zoom = clamp(zoomMultiplier * zoom, Vector2(0.5, 0.5), Vector2(3, 3));
	
