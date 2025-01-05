extends Node2D

signal coin_collected # Creating signal?

# I don't know if the function is needed but I'll leave it
func _process(delta: float) -> void:
	pass


# This function is called when body entered area2d
func _on_area_2d_body_entered(body: Node2D) -> void:
	emit_signal("coin_collected") # Emmiting signal to other nodes?
	queue_free() # Removing coin from scene if is pick up
