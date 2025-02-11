extends Area2D

@onready var hp_label: Label = $hp_label

var hp = 800

func _physics_process(delta: float) -> void:	
	if hp >= 0:
		hp_label.text = str(int(hp)) + " HP" 
	else:
		hp_label.text = "0 HP"
