extends CharacterBody2D

@onready var basic_troop_test: CharacterBody2D = $"."

const SPEED = 35.0

func _ready() -> void:
	basic_troop_test.add_to_group("troop")
	for basic_troop_test in get_tree().get_nodes_in_group("troop"):
		if basic_troop_test == basic_troop_test:
			basic_troop_test.add_collision_exception_with(basic_troop_test)
			basic_troop_test.add_collision_exception_with(basic_troop_test)
			
func _physics_process(delta: float) -> void:
		
	var direction := -1
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
