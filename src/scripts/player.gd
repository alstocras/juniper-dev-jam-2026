extends CharacterBody2D;
@export var speed: float = 400;
@export var rotationSpeed = 3;
var rotationDirection: float;

func _physics_process(delta: float) -> void:
	Global.playerPosition = position;
	var targetDirection = get_global_mouse_position() - global_position
	var targetAngle = targetDirection.angle()
	rotationDirection = Input.get_axis("moveWest", "moveEast");
	
	rotation += rotationDirection * rotationSpeed * delta
	velocity = transform.x * speed * Input.get_axis("moveSouth", "moveNorth")
	
	$AnimatedSprite2D.play("idle");
		
	move_and_slide();
