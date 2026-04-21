extends Node3D

@export var player_basic_bullet: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_bullet_fired(spawn_location: Vector3, starting_rotation: float) -> void:
	var bullet = player_basic_bullet.instantiate()
	bullet.position = spawn_location
	bullet.rotation.y = starting_rotation
	
	add_child(bullet)
	pass # Replace with function body.
