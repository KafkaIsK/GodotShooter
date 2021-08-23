extends Node2D

signal state_changed(new_state)

enum State {
	PATROL,
	ENGAGE
}

onready var player_detection_zone = $PlayerDetectionZone

var current_state: int = State.PATROL setget set_state
var actor = null
var player: Player = null
var weapon: Weapon = null


func _process(delta: float) -> void:
	match current_state:
		State.PATROL:
			pass
		State.ENGAGE:
			if player != null and weapon != null:
				actor.rotation = actor.global_position.direction_to(player.global_position).angle()
				weapon.shoot()
			else:
				print("ENGAGE STATE BUT NO PLAYER/WEAPON")
		_:
			print("ERROR: ENEMY STATE NOT FOUND")


func initialize(actor, weapon: Weapon):
	self.actor = actor
	self.weapon = weapon


func set_state(new_state: int):
	if new_state == current_state:
		return
		
	current_state = new_state
	emit_signal("state_changed", current_state)



func _on_PlayerDetectionZone_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		set_state(State.ENGAGE)
		player = body
