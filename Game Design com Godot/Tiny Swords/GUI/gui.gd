extends CanvasLayer

@onready var timerLabel = %TimerLabel
@onready var meatLabel = %MeatLabel

var timeElapsed: float = 0.0
var meatCounter: int = 0

func _ready():
	GameManager.player.meatCollected.connect(onMeatCollected)
	# padroniza valor inicial em 0
	meatLabel.text = str(meatCounter)

func _process(delta):
	# update timer
	timeElapsed += delta
	
	# floor > arredonda p baixo / ceil > arredonda p cima / round > arredonda p cima ou p baixo (depende do numero)
	var timeElaspsedInSeconds: int = floori(timeElapsed)
	var seconds: int = timeElaspsedInSeconds % 60
	var minutes: int  = timeElaspsedInSeconds / 60
	# formatando o texto no label
	timerLabel.text = "%02d:%02d" % [minutes, seconds]

func onMeatCollected(regenationValue: int) -> void:
	# atualiza o contador do item coletado
	meatCounter += 1
	meatLabel.text = str(meatCounter)
