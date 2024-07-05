extends CanvasLayer

@onready var timerLabel = %TimerLabel
@onready var meatLabel = %MeatLabel
@onready var goldLabel = %GoldLabel

var timeElapsed: float = 0.0

func _process(delta):
	# update timer
	timeElapsed += delta
	
	# floor > arredonda p baixo / ceil > arredonda p cima / round > arredonda p cima ou p baixo (depende do numero)
	var timeElaspsedInSeconds: int = floori(timeElapsed)
	var seconds: int = timeElaspsedInSeconds % 60
	var minutes: int  = timeElaspsedInSeconds / 60
	# formatando o texto no label
	timerLabel.text = "%02d:%02d" % [minutes, seconds]
	
