extends Area2D

var speed = 1

func set_speed(val_a):
	speed = val_a
	print(speed)
	
	
func _physics_process(float):
	move_local_x(speed)
