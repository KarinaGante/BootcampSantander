class_name Enemy
extends Node2D

@export var health: int = 10
@export var deathPrefab: PackedScene

func damage(amount: int) -> void:
	health -= amount
	
	# piscar inimigo (node)
	modulate = Color.RED
	var tween = create_tween()
	tween.set_ease(Tween.EASE_IN)
	tween.set_trans(Tween.TRANS_QUINT)
	tween.tween_property(self, "modulate", Color.WHITE, 0.3)
	
	# tween = abreviacao de between (entre coisas) no sentido de A até B
	
	# processar morte
	if health <= 0:
		die()

func die() -> void:
	if deathPrefab:
		var deathObject = deathPrefab.instantiate()
		deathObject.position = position
		get_parent().add_child(deathObject)
		
	queue_free() # destruindo entidade
