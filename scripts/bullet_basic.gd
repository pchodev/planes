extends RigidBody3D

@export var speed: float = 30

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	linear_velocity = -global_transform.basis.z * speed
	
func _physics_process(delta: float) -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
