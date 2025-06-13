extends Sprite

const bullet = preload("res://bullet.tscn")

func _physics_process(delta):
	if Input.is_action_just_pressed("shoot"):
		var direction = -1 if self.flip_h else 1
		var f = bullet.instance()
		f.direction = direction
		$gunpos.add_child(f)
		f.position.x = f.position.x  + 10 * direction



























#gun following the mouse
#unc _physics_process(delta):
#	position.x = lerp(position.x, get_parent().position.x, 0.5)
#	position.y = lerp(position.y, get_parent().position.y+10, 0.5)
#	var mouse_pos = get_global_mouse_position()
#	look_at(mouse_pos)

