extends CharacterBody2D;
@export var speed: float = 200;

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("moveNorth"):
		velocity.y += speed;
	elif Input.is_action_just_pressed("moveSouth"):
		velocity.y -= speed;
	elif Input.is_action_just_pressed("moveEast"):
		velocity.x += speed;
	elif Input.is_action_just_pressed("moveWest"):
		velocity.x -= speed;
