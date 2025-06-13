extends Control
func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("restartlevel"):
		get_tree().change_scene("res://World.tscn")


#start button
func _on_playbutton_pressed():
	$UI_Cilck.play()
	get_tree().change_scene("res://World.tscn")
	


#exit button
func _on_exit_pressed():
	get_tree().quit()





func _on_playbutton_mouse_entered():
	$UI_Hover.play()



func _on_exit_mouse_entered():
	$UI_Hover.play()
