extends RigidBody2D


@export var r:=10
@export var color := Color.WHITE
@export var speed := 500.0

func _draw() -> void:
	draw_circle(Vector2.ZERO, r, color)
	
func _ready() -> void:
	queue_redraw()
	gravity_scale = 0.0
	linear_velocity = Vector2.LEFT * speed

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
