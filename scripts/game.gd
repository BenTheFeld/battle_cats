extends Node2D

@onready var spawn: CollisionShape2D = $base/spawn

var mynode = preload("res://scenes/basic_troop.tscn")

func inst(pos):
	var instance = mynode.instantiate()
	instance.position = pos
	add_child(instance)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("key 1"):
		inst(spawn.global_position)
