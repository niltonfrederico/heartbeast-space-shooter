extends Area2D

const EffectExplosion = preload("res://EffectExplosion.tscn")

export(int) var SPEED: int = 40
export(int) var ARMOR: int = 3

func _process(delta: float) -> void:
	position.x -= SPEED * delta

func _on_Enemy_body_entered(body: RigidBody2D) -> void:
	body.create_hit_effect()
	body.queue_free()
	
	ARMOR -= 1
	if ARMOR <= 0:
		add_to_score()
		create_explosion()
		queue_free()

func add_to_score():
	var main = get_tree().current_scene
	if main.is_in_group("World"):
		main.score_value += 10

func create_explosion():
	var main = get_tree().current_scene
	var effect_explosion = EffectExplosion.instance()
	main.call_deferred("add_child", effect_explosion)
	effect_explosion.global_position = global_position
