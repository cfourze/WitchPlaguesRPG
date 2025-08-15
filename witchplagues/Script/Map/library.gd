extends Node2D

var book_interact = false
var dialogue_scene := preload("res://Scene/dialogue.tscn")

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
	var existing = get_tree().get_nodes_in_group("content")
	if existing.size() > 0:
		return
	if event.is_action_pressed("interact") and book_interact:
		_create_dialogue()

func _create_dialogue():
	var dialogue_instance = dialogue_scene.instantiate()
	dialogue_instance.get_node("dialogue").main_dialogue = load("res://Dialogue/dialogue1.tres")
	dialogue_instance.add_to_group("content") 
	add_child(dialogue_instance)

func _on_interactable_area_entered(area: Area2D) -> void:
	book_interact = true

func _on_interactable_area_exited(area: Area2D) -> void:
	book_interact = false
