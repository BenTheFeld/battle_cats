extends Area2D

var speed = -1
var is_ready: bool = true
var enemy = 0

@onready var animation_player: AnimationPlayer = $Sprite2D/AnimationPlayer

#@onready var troop_sprite: AnimatedSprite2D = $troop_sprite

#@onready var cooldown: Timer = $troop_sprite/cooldown

func damage():
	print(get_overlapping_areas())
	print("damage")

func attack():
	if  is_ready == true and enemy > 0:
		is_ready = false
		animation_player.play("attack")
		#$troop_sprite/cooldown.start()
		#if troop_sprite.get_frame() == 2:
		#	print("1dmg")
		#print(troop_sprite.get_frame())
	
func _process(delta: float) -> void:
	attack()
	
func _on_troop_range_area_entered(area: Area2D) -> void:
	if  area.is_in_group("enemy"):
		enemy += 1
		speed = 0
		print(enemy)
		
func _on_troop_range_area_exited(area: Area2D) -> void:
	if  area.is_in_group("enemy"):
		enemy -= 1
		speed = -1
		animation_player.play("walk")

func _physics_process(delta: float) -> void:
	move_local_x(speed)
