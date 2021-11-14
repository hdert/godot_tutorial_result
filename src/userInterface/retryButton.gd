extends Button

func _on_button_up() -> void:
	PlayerData.score = PlayerData.end_of_level_score
	get_tree().paused = false
	get_tree().reload_current_scene()
