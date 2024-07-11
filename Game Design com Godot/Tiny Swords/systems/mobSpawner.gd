class_name MobSpawner

extends Node2D

@export var creatures: Array[PackedScene]
@export var mobsPerMinute: float = 60.0

@onready var pathFollow2d: PathFollow2D = %PathFollow2D

var cooldown: float = 0.0

func _process(delta: float):
	# ignorar game over
	if GameManager.isGameOver: return
	
	# temporizador	
	cooldown -= delta
	if cooldown > 0: return
	
	# checar se o ponto é valido
	var point = getPoint()
	
	# perguntar pro jogo (global) se esse ponto (x, y) tem colisao
	var worldState = get_world_2d().direct_space_state
	
	var parameters = PhysicsPointQueryParameters2D.new()
	parameters.position = point
	
	var result: Array = worldState.intersect_point(parameters, 1)
	if not result.is_empty(): return
	
	# frequencia
	var interval = 60.0 / mobsPerMinute
	cooldown = interval
	
	# instanciar(criar) criatura aleatoria
	var index = randi_range(0, creatures.size() - 1)
	var creatureScene = creatures[index]
	var creature = creatureScene.instantiate()
	creature.global_position = point
	get_parent().add_child(creature)

func getPoint() -> Vector2:
	pathFollow2d.progress_ratio = randf()
	return pathFollow2d.global_position
