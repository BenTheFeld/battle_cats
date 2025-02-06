extends Node2D

@onready var spawn: CollisionShape2D = $base/spawn
@onready var money_label: Label = $Camera2D/money_label

var troop1 = preload("res://scenes/basic_troop.tscn")
var money: float = 0.0
var earnings: float = 40.0

func inst(pos):
	var instance = troop1.instantiate()
	instance.position = pos
	add_child(instance)

func _process(delta: float) -> void:
	money += earnings/60
	money_label.text = str(int(money)) + " Money " + str(earnings) + "/s"
	 
	if Input.is_action_just_pressed("key 1") and money > 50:
		var spawn_position = spawn.global_position  
		spawn_position.y += randi_range(0, 20)  
		inst(spawn_position)
		money -= 50
