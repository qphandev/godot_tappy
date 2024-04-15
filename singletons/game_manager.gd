extends Node


var game_scene: PackedScene = preload("res://game/game.tscn") # we want to preload the game scene

func load_game_scene() -> void:
	get_tree().change_scene_to_packed(game_scene) # we're traversing the tree, grabbing the seralized game scene, converting it to the packedscene which is like an abstract
