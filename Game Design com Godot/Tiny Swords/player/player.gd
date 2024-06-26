extends CharacterBody2D

@export var speed = 3
@export var swordDamage: int = 2

@onready var sprite: Sprite2D = $Sprite2D
@onready var animationPlayer: AnimationPlayer = $AnimationPlayer
@onready var swordArea: Area2D = $SwordArea

var inputVector: Vector2 = Vector2(0, 0)
var isRunning: bool = false
var wasRunning: bool = false
var isAttacking: bool = false
var attackCooldown: float = 0.0

func _process(delta: float) -> void: 
	GameManager.playerPosition = position
	
	# ler input
	readInput()
	# processar ataque
	updateAttackCooldown(delta)
	# ataque
	if Input.is_action_just_pressed("attack"):
		attack() 
	# processar animação e rotação de sprite
	playRunIdleAnimation()
	
	if not isAttacking:
		flipSprite()

# a funcao process atualiza em uma velocidade que depende do hardware
# a funcao physics process vai atualizar com um valor fixo independente do harware (+ confiavel)

func _physics_process(delta: float) -> void:
	# modificar velocidade
	var targetVelocity = inputVector * speed * 100.0
	
	if isAttacking:
		targetVelocity *= 0.25
	
	velocity = lerp(velocity, targetVelocity, 0.05)
	move_and_slide()

func readInput() -> void:
	# obter input vector
	inputVector = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	# apagar deadzone do inputVector (em caso de usos de joystick)
	var deadzone = 0.15
	
	if abs(inputVector.x) < deadzone:
		inputVector.x = 0
	if abs(inputVector.y) < deadzone:
		inputVector.y = 0

	# atualizar isRunning
	wasRunning = isRunning
	isRunning = not inputVector.is_zero_approx()

func playRunIdleAnimation() -> void:
	# tocar animacao
	if not isAttacking:		
		if wasRunning != isRunning:
			if isRunning:
				animationPlayer.play("run")
			else:
				animationPlayer.play("idle")

func flipSprite() -> void:
	# girar sprite
	if inputVector.x > 0:
		# desmarcar a propriedade flip_H do sprite2D
		sprite.flip_h = false
		
	elif inputVector.x < 0:
		# marcar flip_H
		sprite.flip_h = true

func updateAttackCooldown(delta: float) -> void:
	# atualizar tempo limite p/ proximo ataque
	if isAttacking:
		attackCooldown -= delta
		if attackCooldown <= 0.0:
			isAttacking = false
			isRunning = false
			animationPlayer.play("idle")

func attack() -> void:
		# ataque side1
	# ataque side2
	if isAttacking:
		return
	# tocar animacao 
	animationPlayer.play("attack_side1")
	
	# configurar temporizador
	attackCooldown = 0.6
	
	# marcar ataque
	isAttacking = true

func damageToEnemies() -> void:
	# acessar inimigos
	var bodies = swordArea.get_overlapping_bodies()
	var enemies = get_tree().get_nodes_in_group("enemies")
	
	for body in bodies:
		if body.is_in_group("enemies"):
			var enemy: Enemy = body
			
			var directionToEnemy = (enemy.position - position).normalized()
			var attackDirection: Vector2
			if sprite.flip_h:
				attackDirection = Vector2.LEFT
			else:
				attackDirection = Vector2.RIGHT
			
			var dotProduct = directionToEnemy.dot(attackDirection)
			
			if dotProduct >= 0.3:
				enemy.damage(swordDamage)
