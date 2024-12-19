extends Area2D

@onready var basic_troop: Area2D = $".."

func _on_area_entered(area):
	if area.is_in_group("enemy"):
		basic_troop.set_speed(0)
		print("enemy!")
	else: 
		basic_troop.set_speed(-1)
