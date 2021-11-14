tool
extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer

export var next_scene: PackedScene

func _on_body_entered(_body: PhysicsBody2D) -> void:
	teleport()

func _get_configuration_warning() -> String:
	return "The next scene property can't be empty." if not next_scene else ""

func teleport() -> void:
	PlayerData.end_of_level_score = PlayerData.score
	anim_player.play("fade_in")
	yield(anim_player, "animation_finished")
	get_tree().change_scene_to(next_scene)
	



