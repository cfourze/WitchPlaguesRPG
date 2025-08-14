extends Node

var current_scene : String = "Library"
var transition_scene : bool = false

var player_start_posx = 384
var player_start_posy = 216

var player_first_loadin : bool = true


func finish_changescenes():
	if transition_scene:
		transition_scene = false
