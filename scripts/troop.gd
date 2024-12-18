extends Area2D

var speed = -1


func _on_area_entered(area):
	if area.is_in_group("enemy"):
		speed = 0
		print("enemy!")
	else: 
		speed = -1

		
func _physics_process(delta):
	move_local_x(speed)
