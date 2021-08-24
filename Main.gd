extends Node2D


onready var capturable_base_manager = $CapturableBaseManager
onready var ally_ai = $AllyMapAI
onready var enemy_ai = $EnemyMapAI
onready var bullet_manager = $BulletManager
onready var player: Player= $Player


func _ready() -> void:
	randomize()
	GlobalSignals.connect("bullet_fired", bullet_manager, "handle_bullet_spawned")
	
	var bases = capturable_base_manager.get_capturable_bases()
	ally_ai.initialize(bases)
	enemy_ai.initialize(bases)


