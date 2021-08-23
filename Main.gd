extends Node2D


onready var bullet_manager = $BulletManager
onready var player = $Player


func _ready() -> void:
	player.connect("player_fired_bullet", bullet_manager, "handle_bullet_spawned")
