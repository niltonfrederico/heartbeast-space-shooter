extends RigidBody2D

const EffectHit = preload("res://EffectHit.tscn")

func create_hit_effect():
	var main = get_tree().current_scene
	var effect_hit = EffectHit.instance()
	main.add_child(effect_hit)
	effect_hit.global_position = global_position
