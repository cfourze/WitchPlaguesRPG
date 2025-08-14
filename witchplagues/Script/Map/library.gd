extends Node2D

var book_interact = false

func _ready() -> void:
	if Global.player_first_loadin:
		$Player.position.x = Global.player_start_posx
		$Player.position.y = Global.player_start_posy
		Global.player_first_loadin = false
	else:
		$Player.position.x = $Classroom.position.x
		$Player.position.y = $Classroom.position.y
	
func _process(delta: float) -> void:
	change_scene()
	
func _on_classroom_body_entered(body: Node2D) -> void:
	if body.has_method('player') :
		Global.transition_scene = true
		Global.current_scene = "Classroom"


func _on_classroom_body_exited(body: Node2D) -> void:
	if body.has_method('player') :
		Global.transition_scene = false

func change_scene():
	if Global.transition_scene:
		get_tree().change_scene_to_file("res://Scene/Map/"+Global.current_scene+".tscn")
		Global.finish_changescenes()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and book_interact:
		$Dialogue.visible = true

func _on_interactable_area_entered(area: Area2D) -> void:
	book_interact = true

func _on_interactable_area_exited(area: Area2D) -> void:
	book_interact = false
