extends CharacterBody2D;
@export var speed: float = 400;
var direction: Vector2;
var mousePos;
var obj;

func _physics_process(delta: float) -> void:
	mousePos = get_global_mouse_position();
	direction = Input.get_vector("moveWest", "moveEast", "moveNorth", "moveSouth");
	
	if direction != Vector2.ZERO:
		velocity = direction * speed;
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed);
		
	
	move_and_slide();
