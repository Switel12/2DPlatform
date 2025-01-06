extends Area2D

# So a moment's thought until I created an “if” that checks if the player is in Area2D then
# when I fired up the game it moved the player immediately to the next scene
# without being able to play the first scene only after creating the “if”
# and calling the move function does the game work as it should.... 
# For fuck's sake I don't know why...

var player_in_area = false

func _on_body_entered(body: Node2D) -> void:
	print(player_in_area) # HERE
	if body.name == "Player":
		player_in_area = true
	print(player_in_area) # HERE
	change_scene()
	
func change_scene():
	if player_in_area:
		get_tree().change_scene_to_file("res://scenes/level2.tscn")


# After debugging i see that two times in console is false
# but player isn't in Area2D?? wtf
