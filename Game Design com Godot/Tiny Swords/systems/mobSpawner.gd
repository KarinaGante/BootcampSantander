extends Node2D

@export var creatures: Array[PackedScene]
@export var mobsPerMinute: float = 60.0

@onready var pathFollow2d: PathFollow2D = %PathFollow2D

var cooldown: float = 0.0

func _process(delta: float):
	# temporizador	
	cooldown -= delta
	if cooldown > 0: return
	
	# frequencia
	var interval = 60.0 / mobsPerMinute
	cooldown = interval
	
	# instanciar(criar) criatura aleatoria
	var index = randi_range(0, creatures.size() - 1)
	var creatureScene = creatures[index]
	var creature = creatureScene.instantiate()
	creature.global_position = getPoint()
	get_parent().add_child(creature)

func getPoint() -> Vector2:
	pathFollow2d.progress_ratio = randf()
	return pathFollow2d.global_position
