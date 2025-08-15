extends CharacterBody2D

@export var speed = 300

func _physics_process(delta):
	if !Global.can_move:
		return
	player_movement(delta)
	current_camera()
	
func player_movement(delta):
	var playeranim = $player
	var dir:Vector2 = Input.get_vector('left','right','up','down')
	velocity = dir * speed
	move_and_slide()
	if dir.x < 0:
		playeranim.play("left")
		$InteractArea/Interact.position = Vector2(-160, 100)
	elif dir.x > 0:
		playeranim.play("right")
		$InteractArea/Interact.position = Vector2(160, 100)
	elif dir.y < 0:
		playeranim.play("up")
		$InteractArea/Interact.position = Vector2(0, 0)
	elif dir.y > 0:
		playeranim.play("down")
		$InteractArea/Interact.position = Vector2(0, 300)
	

func player():
	pass
	
func current_camera():
	if Global.current_scene == "Library":
		$Camera2D.limit_bottom = 1008
	elif Global.current_scene == "Classroom":
		$Camera2D.limit_bottom = 624
		
	
