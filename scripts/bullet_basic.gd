extends Area3D

@export var speed: float = 30
@export var attack_power: int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += -transform.basis.z * (speed * delta)
	pass
	
func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("enemies"):
		area.call("take_damage", attack_power)
		
	queue_free()
	pass # Replace with function body.
