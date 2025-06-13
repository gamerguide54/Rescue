extends Area2D


func _on_life_body_entered(body):
	print("life added")
	queue_free()
