extends Node

@export var speed: float = 1.25

var enemy: Enemy
var sprite: AnimatedSprite2D

func _ready():
	enemy = get_parent()
	sprite  = enemy.get_node("AnimatedSprite2D")

func _physics_process(delta: float) -> void :
	# calculo direcao
	var playerPosition = GameManager.playerPosition
	var difference = playerPosition - enemy.position
	var inputVector = difference.normalized()
	
	# movimento
	enemy.velocity = inputVector * speed * 100.0
	
	enemy.move_and_slide()
	
	# girar sprite
	if inputVector.x > 0:
		sprite.flip_h = false
	elif inputVector.x < 0:
		sprite.flip_h = true
