extends Node2D

var damage: int
var moveDirection: Vector2
var speed: int = 500

func _physics_process(delta):
	$"bullet sprite".position.x += speed * delta

@export var target: Node2D

func set_target(value: Node2D):
	target = value

func _ready():
	look_at(target.position)


func _on_hitbox_area_entered(area):
	print("hurt!")
