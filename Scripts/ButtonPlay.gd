extends Button


func _ready():
	pass


func _on_Buttontitleplay_pressed():
	get_tree().change_scene_to_file("res://Assets/Level.tscn")
