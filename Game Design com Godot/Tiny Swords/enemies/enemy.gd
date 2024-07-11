class_name Enemy
extends Node2D

@export_category("Life")
@export var health: int = 10
@export var deathPrefab: PackedScene
var digitDamagePrefab: PackedScene

@export_category("Drops")
@export var dropChance: float = 0.1
@export var dropItems: Array[PackedScene]
@export var dropChances: Array[float]

@onready var damageDigitMarker = $DamageDigitMarker

func _ready():
	digitDamagePrefab = preload("res://misc/damageDigit.tscn")

func damage(amount: int) -> void:
	health -= amount
	
	# piscar inimigo (node)
	modulate = Color.RED
	var tween = create_tween()
	tween.set_ease(Tween.EASE_IN)
	tween.set_trans(Tween.TRANS_QUINT)
	tween.tween_property(self, "modulate", Color.WHITE, 0.3)
	# tween = abreviacao de between (entre coisas) no sentido de A até B
	
	# criar damage digit
	var damageDigit = digitDamagePrefab.instantiate()
	damageDigit.value = amount
	
	if damageDigitMarker:
		damageDigit.global_position = damageDigitMarker.global_position
	else:
		damageDigit.global_position = global_position
	
	get_parent().add_child(damageDigit)
	
	# processar morte
	if health <= 0:
		die()

func die() -> void:
	# caveira da morte
	if deathPrefab:
		var deathObject = deathPrefab.instantiate()
		deathObject.position = position
		get_parent().add_child(deathObject)

	# drop
	if randf() <= dropChance:
		dropItem()

	# incrementar contador
	GameManager.monstersDefeatedCounter += 1
	
	# deletar obj
	queue_free() # destruindo entidade

func dropItem() -> void:
	var drop = getRandomDropItem().instantiate()
	drop.position = position
	get_parent().add_child(drop)

func getRandomDropItem() -> PackedScene:
	# lista com 1 item
	if dropItems.size() == 1:
		return dropItems[0]
	
	# calcula chance maxima
	var maxChance: float = 0.0
	for dropChance in dropChances:
		maxChance += dropChance
	
	# jogar dado
	var randomValue = randf() * maxChance
	
	# girar roleta
	var needle: float = 0.0
	for i in dropItems.size():
		var dropItem = dropItems[i]
		var dropChance = dropChances[i] if i < dropChances.size() else 1
		if randomValue <= dropChance + needle:
			return dropItem
		needle += dropChance

	return dropItems[0]
