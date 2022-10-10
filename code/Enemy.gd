extends Area2D

export(int) var SPEED: int = 20
export(int) var ARMOR: int = 3

func _process(delta: float) -> void:
	position.x -= SPEED * delta

func _on_Enemy_body_entered(body: RigidBody2D) -> void:
	body.queue_free()
	
	ARMOR -= 1
	if ARMOR <= 0:
		queue_free()
