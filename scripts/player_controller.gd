extends CharacterBody3D

@export var Speed = 5.0
@export var FireCooldown = 0.25
@export var bullet_basic_scene: PackedScene

@onready var marker = $BulletSpawn

var current_cooldown = 0
var gun_level = 1

signal bullet_fired(position: Vector3, rotation: float)

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * Speed
		velocity.z = direction.z * Speed
	else:
		velocity.x = move_toward(velocity.x, 0, Speed)
		velocity.z = move_toward(velocity.z, 0, Speed)

	move_and_slide()

func _process(delta):
	if Input.is_action_pressed("fire"):
		if current_cooldown == 0:
			bullet_fired.emit(marker.global_position, 0)
			if gun_level >= 2:
				bullet_fired.emit(marker.global_position, -0.1)
				bullet_fired.emit(marker.global_position, 0.1)
			if gun_level >= 3:
				bullet_fired.emit(marker.global_position, -0.05)
				bullet_fired.emit(marker.global_position, 0.05)
				
			current_cooldown = FireCooldown
	
	if current_cooldown > 0:
		current_cooldown = clamp(current_cooldown - delta, 0, 0.25)
	
	return
