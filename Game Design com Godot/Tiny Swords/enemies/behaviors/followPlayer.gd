extends CharacterBody2D

@export var speed: float = 1

func _physics_process(delta: float) -> void :
	var playerPosition = Vector2(0, 0)
	var difference = playerPosition - position
	var inputVector = difference.normalized()
	
	velocity = inputVector * speed * 100.0
	
	move_and_slide()
