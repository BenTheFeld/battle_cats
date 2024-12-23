extends Area2D

@onready var enemy_troop: Area2D = $".."

func _on_area_entered(area):
	if area.is_in_group("troop"):
		enemy_troop.set_speed(0)
		print("troop!")
	else: 
		enemy_troop.set_speed(1)
