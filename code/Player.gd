extends Area2D

export(int) var SPEED: int = 100

const EffectExplosion = preload("res://EffectExplosion.tscn")
const Bullet = preload("res://Bullet.tscn")

func _process(delta: float) -> void:
	# if Input.is_action_pressed("ui_right"): move(SPEED, 0, delta)
	# if Input.is_action_pressed("ui_left"): move(-SPEED, 0, delta)
	if Input.is_action_pressed("ui_up"): move(0, -SPEED, delta)
	if Input.is_action_pressed("ui_down"): move(0, SPEED, delta)
	if Input.is_action_just_pressed("ui_accept"): fire()
	

func move(x_speed: int, y_speed: int, delta: float) -> void:
	position.x += x_speed * delta
	position.y += y_speed * delta

func fire() -> void:
	var bullet = Bullet.instance()
	var main = get_tree().current_scene
	main.add_child(bullet)
	bullet.global_position = global_position

func _on_Player_area_entered(area: Area2D) -> void:
	area.queue_free()
	queue_free()

func _exit_tree():
	var main = get_tree().current_scene
	var effect_explosion = EffectExplosion.instance()
	main.call_deferred("add_child", effect_explosion)
	effect_explosion.global_position = global_position
