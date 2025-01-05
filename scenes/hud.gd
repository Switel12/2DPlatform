extends CanvasLayer

var coins = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.text = "POINTS: " + str(coins)



func _on_node_2d_coin_collected() -> void:
	coins = coins + 1
