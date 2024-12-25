extends Area2D

var speed = -1

func _on_troop_range_area_entered(area: Area2D) -> void:
		if area.is_in_group("troop"):
			speed = 0
	
func _on_troop_range_area_exited(area: Area2D) -> void:
		if area.is_in_group("troop"):
			speed = -1
	

func _physics_process(float):
	move_local_x(speed)