extends Area3D

@export var health = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("enemies")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func take_damage(damage: int) -> void:
	health -= damage
	if health <= 0:
		die()

func die() -> void:
	queue_free()
