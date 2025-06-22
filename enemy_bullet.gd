extends KinematicBody2D
var velocity = Vector2()
export var speed = 1000
var direction = -1 


func _ready():
	velocity.x = speed * direction



func _physics_process(delta):
	if is_on_wall(): 
		queue_free()
	velocity = move_and_slide(velocity, Vector2.UP) #move the bullet
	




func _on_Area2D_body_entered(body):
	queue_free()
	print("del")
