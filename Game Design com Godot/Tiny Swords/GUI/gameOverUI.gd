class_name GameOverUI

extends CanvasLayer

@onready var timeLabel = %TimeLabel
@onready var monstersLabel = %MonstersLabel

@export var restartDelay: float = 5.0
var restartCooldown: float

func _ready():
	timeLabel.text = GameManager.timeElapsedString
	monstersLabel.text = str(GameManager.monstersDefeatedCounter)
	restartCooldown = restartDelay

func _process(delta):
	restartCooldown -= delta
	
	if restartCooldown <= 0:
		restartGame()

func restartGame():
	GameManager.reset()
	get_tree().reload_current_scene()
