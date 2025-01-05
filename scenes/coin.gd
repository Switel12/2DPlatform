extends Node2D

signal coin_collected

func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	emit_signal("coin_collected")
	queue_free()
