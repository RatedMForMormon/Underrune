extends Node2D

var damage: int
var speed: int = 300
@export var target: Node2D

func _physics_process(delta):
	$"bullet sprite".position.x += speed * delta

func set_target(value: Node2D):
	target = value

func _ready():
	look_at(target.position)


func _on_area_2d_area_entered(area):
	print("hurt! But with a wave :)")
