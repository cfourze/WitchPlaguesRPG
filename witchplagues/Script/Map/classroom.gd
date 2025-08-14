extends Node2D


func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	change_scene()
	
func _on_library_body_entered(body: Node2D) -> void:
	if body.has_method('player') :
		Global.transition_scene = true
		Global.current_scene = "Library"

func _on_library_body_exited(body: Node2D) -> void:
	if body.has_method('player') :
		Global.transition_scene = false

func change_scene():
	if Global.transition_scene == true:
		get_tree().change_scene_to_file("res://Scene/Map/"+Global.current_scene+".tscn")
		Global.finish_changescenes()
