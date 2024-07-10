extends Node

@export var mobSpawner: MobSpawner
@export var initialSpawnRate: float = 60.0
@export var spawnRatePerMinute: float = 30.0
@export var waveDuration: float = 20.0
@export var breakIntensity: float = 0.5

var time: float = 0.0

func _process(delta):
	time += delta
	
	# dificuldade linear
	var spawnRate  = initialSpawnRate + spawnRatePerMinute * (time / 60.0)
	# o godot tem PI (3.14) e TAU (2 * PI) por padrao, so chamar as constantes pra uso
	var sinWave = sin((time * TAU) / waveDuration)
	# func remap transforma os valores fornecidos sem ultrapassar o min e max estipulado
	var waveFactor = remap(sinWave, -1.0, 1.0, breakIntensity, 1)
	spawnRate *= waveFactor
	
	# aplica dificuldade
	mobSpawner.mobsPerMinute = spawnRate
