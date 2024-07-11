extends CanvasLayer

@onready var timerLabel = %TimerLabel
@onready var meatLabel = %MeatLabel

func _process(delta: float):
	# update labels
	meatLabel.text = str(GameManager.meatCounter)
	timerLabel.text = GameManager.timeElapsedString
