extends CharacterBody3D

var velocity = Vector3(0,0,0)
const SPEED = 10

	
func _ready():
	pass

func _process(delta): # repeats 60 fps. 
	
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		velocity.x = 0
	
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
	else:
		velocity.x = velocity.x * 0.95    # same as line 30. Just a few calculation less therefore quicker
	
		
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.z = 0
		
	elif Input.is_action_pressed("ui_down"):
		velocity.z = SPEED
	elif Input.is_action_pressed("ui_up"):
		velocity.z = -SPEED
	
	else:
		velocity.z = lerp(velocity.z,0,0.05)
	$MeshInstance3D.rotate_z(deg_to_rad(-velocity.x*delta*100))
	$MeshInstance3D.rotate_x(deg_to_rad(velocity.z*delta*100))
	set_velocity(velocity)
	move_and_slide()


func _on_enemy_new_body_entered(body):
	if body.name == "Bally":
		get_tree().change_scene_to_file("res://Assets/GameOverScreen.tscn")
		




