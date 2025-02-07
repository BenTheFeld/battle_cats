extends Node2D

@onready var money_label: Label = $Camera2D/money_label
@onready var spawn: CollisionShape2D = $Grass/base/spawn
@onready var enemy_spawn: CollisionShape2D = $Grass/enemy_base/spawn
@onready var enemy_spawn_timer: Timer = $enemy_spawn_timer

var troop1 = preload("res://scenes/basic_troop.tscn")
var enemy1 = preload("res://scenes/enemy_troop.tscn")
var money: float = 0.0
var earnings: float = 50

func inst(pos, troop):
	var instance = troop.instantiate()
	instance.position = pos
	add_child(instance)

func _physics_process(delta: float) -> void:
	money += earnings/60
	money_label.text = str(int(money)) + " Money " + str(earnings) + "/s"
	 
	if Input.is_action_just_pressed("key 1") and money > 50:
		var spawn_position = spawn.global_position  
		spawn_position.y += randi_range(0, 20)  
		inst(spawn_position, troop1)
		money -= 50

func _on_timer_timeout() -> void:
	var enemy_spawn_position = enemy_spawn.global_position  
	enemy_spawn_position.y += randi_range(0, 20)  
	inst(enemy_spawn_position, enemy1)
