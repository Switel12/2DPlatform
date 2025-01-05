extends CanvasLayer

var coins = 0 # Number of coins thats been pick up

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.text = "POINTS: " + str(coins) # Change of value at each frame if the player has collected coins


# Signal from coin.gd script if player entered coin then adds +1 to coin value
func _on_node_2d_coin_collected() -> void:
	coins = coins + 1
