extends KinematicBody2D

#player Mode
enum States {AIR, FLOOR}
var state = States.AIR

#settings
var velocity = Vector2(0,0)
var coins = 0       #store coins 
var heath = 100     #player life
const speed = 190   #player speed
const jump = 900    #player jump speed 
const gravity = 30  #player
var direction = 1
var hurt := 0
const bullet = preload("res://bullet.tscn")
 



func _physics_process(delta):
	#print(state)
	
	match state:
		States.AIR:
			if is_on_floor():
				state = States.FLOOR
				continue
			$Sprite.play("jump")
			if Input.is_action_pressed("right"):
				velocity.x = speed
				$Sprite.flip_h = false
				$gun.flip_h = false
				$gun.offset.x = 4
				
			  
			elif Input.is_action_pressed("left"):
				velocity.x = -speed
				$Sprite.flip_h = true
				$gun.flip_h = true
				$gun.offset.x = -20
				
			else:
				velocity.x = lerp(velocity.x,0,0.1)
			move_and_fall()
			


		States.FLOOR:
			if not is_on_floor():
				state = States.AIR
			if Input.is_action_pressed("right"):
				$gun/gunpos.position.x = 18
				$Sprite.play("walk")
				$Sprite.flip_h = false
				velocity.x = speed
				direction = 1
				$gun.flip_h = false
				$gun.offset.x = 4
				
				
				
			elif Input.is_action_pressed("left"):
				$gun/gunpos.position.x = -30
				velocity.x = -speed
				$Sprite.play("walk")
				$Sprite.flip_h = true
				direction = -1
				$gun.flip_h = true
				$gun.offset.x = -20
				
				

				
			else:
				$Sprite.play("idle")
				velocity.x = lerp(velocity.x,0,0.1)
				
			if Input.is_action_just_pressed("jump"):
				$soungjump.play()
				velocity.y = -jump
				state = States.AIR
				
			move_and_fall()
			#print($gun/gunpos.position)
			$Label.text = String(heath)
			#when the player gets to low
			if heath == 0:
				print("ok it work") 
			
			#if heath < 1:
			#	dead()
				#$Timer0.start()
				#$Sprite.play("dead")
				
			#elif heath > 100:
			#	print("hight")
			


#move and fall
func move_and_fall():
	velocity.y = velocity.y + gravity
	velocity = move_and_slide(velocity,Vector2.UP)
	
	
#revice from enemy with position
func bounce():
	print("bounce")
	velocity.y = -jump * 0.7
	heath = heath -10
	set_modulate(Color(10,10,10,0.9))
	hurt = 20
	$Timer.start()
	
	
func hit_side(var enemypos):
	heath = heath -25
	if position.x < enemypos:
		velocity.x = -800
	elif position.x > enemypos:
		velocity.x = 800
	Input.action_release("left")
	Input.action_release("right")
	set_modulate(Color(10,10,10,0.9))
	hurt = 20
	$Timer.start()
	
	
	
	
func dead():
	print("dead")
	$Sprite.play("dead")

	



func _on_fallzone_body_entered(body):
	print("world restarted")
	get_tree().change_scene("res://World.tscn")






























	
	
#func side_hit(var enemyposx): 
	#(var enmyposx) get the enemy position 
#	print("player got hit")                   
#	if position.x < enemyposx:
#		velocity.x = -800
		
#	elif position.x > enemyposx:
#		velocity.x = 800
	

	
#old code dont kmow if this needed
#add one to the coins var
func add_coin():
	coins = coins + 1
	#print out info to the commline
	print(coins)
	
	
	
	

#needed code
func _on_Timer_timeout():
	hurt -= 1
	if hurt == 0:
		$Timer.stop()
		set_modulate(Color(1,1,1,1))
	else:
		set_modulate(Color(10,10,10,0.9) if hurt % 2 == 0 else Color(1,0.3,0.3,0.7))
	


func _on_life_body_entered(body):
	heath = heath +19
