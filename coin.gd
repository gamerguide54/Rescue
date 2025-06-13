extends Area2D

#send to the HUD
signal coin_collected


func _on_coin_body_entered(body):
	$soungs.play()
	emit_signal("coin_collected")
	queue_free()
