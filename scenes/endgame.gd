extends Area2D

var player_in_area = false

func _on_body_entered(body: Node2D) -> void:
	print(player_in_area) # HERE
	if body.name == "Player":
		player_in_area = true
	print(player_in_area) # HERE
	change_scene()
	
func change_scene():
	if player_in_area:
		get_tree().quit()
