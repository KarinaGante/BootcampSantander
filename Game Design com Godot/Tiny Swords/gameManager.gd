extends Node

signal gameOver

var player: Player
var playerPosition: Vector2
var isGameOver: bool = false

var timeElapsed: float = 0.0
var timeElapsedString: String
var meatCounter: int = 0
var monstersDefeatedCounter: int = 0

func _process(delta):
	# update timer
	timeElapsed += delta
	
	# floor > arredonda p baixo / ceil > arredonda p cima / round > arredonda p cima ou p baixo (depende do numero)
	var timeElaspsedInSeconds: int = floori(timeElapsed)
	var seconds: int = timeElaspsedInSeconds % 60
	var minutes: int  = timeElaspsedInSeconds / 60
	# formatando o texto no label
	timeElapsedString = "%02d:%02d" % [minutes, seconds]

func endGame():
	if isGameOver: return
	isGameOver = true
	gameOver.emit()

func reset():
	player = null
	playerPosition = Vector2.ZERO
	isGameOver = false
	
	timeElapsed = 0.0
	timeElapsedString = "00:00"
	meatCounter = 0
	monstersDefeatedCounter = 0
	
	for connection in gameOver.get_connections():
		gameOver.disconnect(connection.callable)
