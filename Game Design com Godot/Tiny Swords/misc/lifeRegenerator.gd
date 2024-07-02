extends Node2D

@export var regenerationAmount: int = 10

func _ready():
	$Area2D.body_entered.connect()
	
func onBodyEntered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var player = body
		player.heal(regenerationAmount)
		queue_free()
