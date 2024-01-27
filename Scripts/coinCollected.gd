extends Label

var coins = 0


func _ready():
	text = String(coins)


func _on_coin_collected():
	coins = coins + 1
	
	_ready()
	if coins == 15:
		get_tree().change_scene_to_file("res://Assets/WinScreen.tscn")
		


