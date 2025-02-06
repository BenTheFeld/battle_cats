extends Area2D

const SPEED = 0.7

var direction = -1
var speed_multiplier = 1
var target = null
var damage = 10
var hp = 80

@onready var troop_range: Area2D = $troop_range
@onready var animation_player: AnimationPlayer = $Sprite2D/AnimationPlayer
#@onready var cooldown: Timer = $troop_sprite/cooldown

func _ready() -> void:
	z_index = position.y

func attack():
	animation_player.play("attack")
	
func hurt(enemy_target):
		enemy_target.hp -= damage
		print(enemy_target)
	
func hit():
	hurt(target)

func _physics_process(delta: float) -> void:
	var overlapping_areas = troop_range.get_overlapping_areas()
	var enemies_in_range = overlapping_areas.filter(func(body): return body.is_in_group("enemy"))
	if enemies_in_range.size() > 0:
		target = enemies_in_range[randi() % enemies_in_range.size()]
		attack()
		speed_multiplier = 0
	else:
		speed_multiplier = 1
		animation_player.play("walk")
		
	if hp <= 0:
		queue_free()
	
	move_local_x(direction * SPEED * speed_multiplier)
