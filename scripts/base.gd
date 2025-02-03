extends Area2D

var hp = 200

func _physics_process(delta: float) -> void:	
	print(hp)
	if hp <= 0:
		print("loss")
