extends CharacterBody2D

@export var speed = 3

@onready var sprite: Sprite2D = $Sprite2D
@onready var animationPlayer: AnimationPlayer = $AnimationPlayer

var isRunning: bool = false

# a funcao process atualiza em uma velocidade que depende do hardware
# a funcao physics process vai atualizar com um valor fixo independente do harware (+ confiavel)

func _physics_process(delta: float) -> void:
	# obter input vector
	var inputVector = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	# apagar deadzone do inputVector (em caso de usos de joystick)
	var deadzone = 0.15
	
	if abs(inputVector.x) < deadzone:
		inputVector.x = 0
	if abs(inputVector.y) < deadzone:
		inputVector.y = 0
	
	# modificar velocidade
	var targetVelocity = inputVector * speed * 100.0
	velocity = lerp(velocity, targetVelocity, 0.05)
	move_and_slide()
	
	# atualizar isRunning
	var wasRunning = isRunning
	isRunning = not inputVector.is_zero_approx()
	
	# tocar animacao
	if wasRunning != isRunning:
		if isRunning:
			animationPlayer.play("run")
		else:
			animationPlayer.play("idle")
			
	# girar sprite
	if inputVector.x > 0:
		# desmarcar a propriedade flip_H do sprite2D
		sprite.flip_h = false
		
	elif inputVector.x < 0:
		# marcar flip_H
		sprite.flip_h = true
