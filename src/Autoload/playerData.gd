extends Node

signal score_updated
signal player_died

var score: = 0 setget set_score
var end_of_level_score: = 0
var deaths: = 0 setget set_deaths

func reset() -> void:
	score = 0
	deaths = 0

func set_score(new_score: int) -> void:
	score = new_score
	emit_signal("score_updated")

func set_deaths(new_death_count: int) -> void:
	if new_death_count > deaths:
		deaths = new_death_count
		emit_signal("player_died")
	deaths = new_death_count
