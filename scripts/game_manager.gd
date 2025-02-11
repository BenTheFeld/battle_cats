extends Node2D

@onready var money_label: Label = $Camera2D/money_label
@onready var game_outcome: Label = $Camera2D/game_outcome

@onready var spawn: CollisionShape2D = $Grass/base/spawn
@onready var enemy_spawn: CollisionShape2D = $Grass/enemy_base/spawn

@onready var base: Area2D = $Grass/base
@onready var enemy_base: Area2D = $Grass/enemy_base

@onready var troop1_cooldown: Timer = $Camera2D/troop_button/cooldown
@onready var enemy_spawn_timer: Timer = $enemy_spawn_timer

@onready var troop_button: TextureButton = $Camera2D/troop_button

var troop1 = preload("res://scenes/basic_troop.tscn")
var troop1_ready: bool = true

var enemy1 = preload("res://scenes/enemy_troop.tscn")

var money: float = 0.0
var earnings: float = 50

func inst(pos, troop):
	var instance = troop.instantiate()
	instance.position = pos
	add_child(instance)
	
func _ready() -> void:
	game_outcome.hide()

func _physics_process(delta: float) -> void:
	money += earnings/60
	money_label.text = str(int(money)) + " Money " + str(earnings) + "/s"
	
	if troop1_ready == false:
		troop_button.disabled
	else:
		not troop_button.disabled
	
	if base.hp <= 0:
		game_outcome.text = "You lost"
		game_outcome.show()
		
	if enemy_base.hp <= 0:
		game_outcome.text = "You won"
		game_outcome.show()
		
	if Input.is_action_just_pressed("key 1") and money > 50 and troop1_ready == true:
		var spawn_position = spawn.global_position  
		spawn_position.y += randi_range(0, 20)  
		inst(spawn_position, troop1)
		money -= 50
		troop1_ready = false
		troop1_cooldown.start()
		
func _on_timer_timeout() -> void:
	var enemy_spawn_position = enemy_spawn.global_position  
	enemy_spawn_position.y += randi_range(0, 20)  
	inst(enemy_spawn_position, enemy1)

func _on_troop_button_pressed() -> void:
	if money > 50 and troop1_ready == true:
		var spawn_position = spawn.global_position  
		spawn_position.y += randi_range(0, 20)  
		inst(spawn_position, troop1)
		money -= 50
		troop1_ready = false
		troop1_cooldown.start()
		
func troop1_on_cooldown_timeout() -> void:
	troop1_ready = true
