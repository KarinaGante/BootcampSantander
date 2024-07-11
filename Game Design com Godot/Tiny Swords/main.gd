extends Node

@export var gameUI: CanvasLayer
@export var gameOverUItemplate: PackedScene

func _ready():
	GameManager.gameOver.connect(triggerGameOver)

func triggerGameOver():
	# deletar game UI
	if gameUI:
		gameUI.queue_free()
		gameUI = null
		
	# criar game over UI
	var gameOverUI: GameOverUI = gameOverUItemplate.instantiate()
	gameOverUI.monstersDefeated = 999
	gameOverUI.timeSurvived = "01:58"
	add_child(gameOverUI)
