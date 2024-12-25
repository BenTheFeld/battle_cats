extends Area2D

var speed = -1
var is_ready: bool = true

@onready var troop_sprite: AnimatedSprite2D = $troop_sprite

func attack():
	if  is_ready == true:
		is_ready = false
		troop_sprite.play("attack")
		$troop_sprite/cooldown.start()
		troop_sprite.play("wait")

func _on_timer_timeout() -> void:
	is_ready = true
	
func _on_troop_range_area_entered(area: Area2D) -> void:
	if  area.is_in_group("enemy"):
		speed = 0
		attack()
		
func _on_troop_range_area_exited(area: Area2D) -> void:
	if  area.is_in_group("enemy"):
		speed = -1
		print("no enemy")
		troop_sprite.play("walk")

func _physics_process(delta: float) -> void:
	move_local_x(speed)
