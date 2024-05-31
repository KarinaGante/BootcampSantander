extends Node

@export var objectTemplates: Array[PackedScene]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	# check if event is a click / verificar se o evento é um click
	if event is InputEventMouseButton:
		if event.button_index == 1:
			if event.pressed:
				spawnObject(event.position)
	
func spawnObject(position: Vector2) -> void:
	var index: int = randi_range(0, objectTemplates.size() -1)
	var objectTemplate = objectTemplates[index]
	var object: RigidBody2D = objectTemplate.instantiate()
	object.position = position
	add_child(object)
