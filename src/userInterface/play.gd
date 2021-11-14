tool
extends Button

export(String, FILE) var next_scene: = ""

func _get_configuration_warning():
	return "Please set next scene." if next_scene == "" else ""

func _on_button_up() -> void:
	get_tree().change_scene(next_scene)
	get_tree().paused = false
	PlayerData.score = 0
	PlayerData.end_of_level_score = 0
	PlayerData.deaths = 0
