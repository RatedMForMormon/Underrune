extends Node2D

var speed = 300

@export var target: Node2D
var bullet_scene = preload("res://scenes/bullet.tscn")
var wave_scene = preload("res://scenes/bullet wave.tscn")

var firing_mode: bool = true

var random_timer = Timer.new()

func _ready():
	add_child(random_timer)
	random_timer.wait_time = randf_range(10.0, 20.0)
	random_timer.connect("timeout", _on_random_timeout)
	random_timer.start()

func spawn_bullet():
	var bullet
	if firing_mode:
		bullet = bullet_scene.instantiate()
	else:
		bullet = wave_scene.instantiate()
		firing_mode = !firing_mode
	bullet.position = position + $"bullet spawn".position
	bullet.set_target(target)
	remove_child(bullet)
	get_parent().add_child(bullet)
	
func _on_random_timeout():
	firing_mode = !firing_mode
	random_timer.wait_time = randf_range(10.0, 20.0)
	random_timer.start()
	
func _on_timer_timeout():
	spawn_bullet()
