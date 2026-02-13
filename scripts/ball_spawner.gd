extends Node2D

@export var ball_scene: PackedScene
@export var respawn_delay := 2.0
@onready var spawn_point: Marker2D = $SpawnPosition

var current_ball: Node = null

func _ready() -> void:
	call_deferred("spawn_ball")
	
func spawn_ball() -> void:
	current_ball = ball_scene.instantiate()
	get_tree().current_scene.add_child(current_ball)
	current_ball.global_position = spawn_point.global_position
	# print(current_ball.global_position)
	current_ball.tree_exited.connect(_on_ball_gone)

func _on_ball_gone() -> void:
	if is_inside_tree() == false:
		return
	current_ball = null
	await get_tree().create_timer(respawn_delay).timeout
	spawn_ball()
