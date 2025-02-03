extends Area2D

func _physics_process(delta: float) -> void:
	var overlapping_bodies = get_overlapping_bodies()
	if overlapping_bodies.size() > 0:
		for body in overlapping_bodies:
			if body.is_in_group("enemy"):
				print("Detected enemy:", body.name)
