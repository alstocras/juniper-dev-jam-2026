extends RigidBody2D;

func _process(delta: float) -> void:
	if not $AnimatedSprite2D.is_playing():
		$AnimatedSprite2D.play("extract");
