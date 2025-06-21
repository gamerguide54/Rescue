extends KinematicBody2D
var velocity = Vector2()
export var speed = 1000
var direction = -1 


func _ready():
	velocity.x = speed * direction

#func enemybullethit():
#	queue_free()
	
#func hit_side():
#	pass


func _physics_process(delta):
	if is_on_wall():
		queue_free()
	velocity = move_and_slide(velocity, Vector2.UP) #move the bullet
	


