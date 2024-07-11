extends Node

signal gameOver

var player: Player
var playerPosition: Vector2
var isGameOver: bool = false

func endGame():
	if isGameOver: return
	isGameOver = true
	gameOver.emit()

func reset():
	player = null
	playerPosition = Vector2.ZERO
	isGameOver = false
	
	for connection in gameOver.get_connections():
		gameOver.disconnect(connection.callable)
