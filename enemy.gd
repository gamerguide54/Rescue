extends KinematicBody2D
var velocity = Vector2()
export var speed = 50
export var direction = 1
export var detects_cliffs = true
var heath = 100
signal enemy_kill_number

#test code
const bullet = preload("res://enemy_bullet.tscn"   )

onready var ray_cast_2d: RayCast2D = $player_checker


func _ready():
	if direction == -1:
		$AnimatedSprite.flip_h = false
	$flooer_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$flooer_checker.enabled = detects_cliffs
	
	
	
	
	
	
	
	
func _physics_process(delta):
	velocity.y += 20
	if is_on_wall() or not $flooer_checker.is_colliding() and detects_cliffs and is_on_floor():
		direction = direction * -1
		
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$flooer_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	
	velocity.x = speed * direction
	velocity = move_and_slide(velocity, Vector2.UP)
	$Label.text = String(heath)
	if heath < 0:
		pass
		#emit_signal("enemy_kill_number")
		
		
		
		
	#switch the raycast position
	if direction == -1:
		$player_checker.rotation_degrees = 90
		
	elif direction == 1:
		$player_checker.rotation_degrees = -90 
		
		
		
	#test codes	
	if ray_cast_2d.is_colliding() == false:
		print("player not see")
	elif ray_cast_2d.is_colliding() == true:
		print("see player")
	
	
	if Input.is_action_just_pressed("test"):
		var f = bullet.instance()
		.add_child(f)
		
		
		



		
	

		




func _on_side_checker_body_entered(body):
	body.hit_side(position.x)   #spend to player with position
	#yield(get_tree().create_timer(2), "timeout") #wait for a sec
	#print("timer works")
	heath = heath -10
	if heath < 1:
		dead() #call a func


func _on_top_checher_body_entered(body):
	emit_signal("enemy_kill_number")
	$AnimatedSprite.play("dead")
	speed = 0
	set_collision_layer_bit(4, false)
	set_collision_mask_bit(0, false)
	$top_checher.set_collision_layer_bit(4, false)
	$top_checher.set_collision_mask_bit(0, false)
	$side_checker.set_collision_layer_bit(4, false)
	$side_checker.set_collision_mask_bit(0, false)
	$Timer0.start()
	body.bounce()     #spend to player

#func
func dead():
	print("enemy dead")
	emit_signal("enemy_kill_number")
	queue_free()

	
func _on_Timer0_timeout():
	queue_free()


#func _on_Timer1_timeout():
#	queue_free()
