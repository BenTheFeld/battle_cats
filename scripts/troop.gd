extends Area2D

var speed = -1
var is_ready: bool = true
var enemy = 0

@onready var troop_sprite: AnimatedSprite2D = $troop_sprite
	
func attack():
	if  is_ready == true and enemy > 0:
		is_ready = false
		troop_sprite.play("attack")
		$troop_sprite/cooldown.start()
			
func _on_timer_timeout() -> void:
	is_ready = true
	
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
		troop_sprite.play("walk")

func _physics_process(delta: float) -> void:
	move_local_x(speed)
