extends CharacterBody2D

@export var speed: float = 1.25

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void :
	# calculo direcao
	var playerPosition = GameManager.playerPosition
	var difference = playerPosition - position
	var inputVector = difference.normalized()
	
	# movimento
	velocity = inputVector * speed * 100.0
	
	move_and_slide()
	
	# girar sprite
	if inputVector.x > 0:
		sprite.flip_h = false
	elif inputVector.x < 0:
		sprite.flip_h = true
