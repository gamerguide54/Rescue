extends KinematicBody2D
var velocity = Vector2()
export var speed = 800
var direction = 1 


func hit_side(var enemypos):
	queue_free()

func _ready():
	velocity.x = speed * direction
	
func _physics_process(delta):
	if is_on_wall():
		queue_free()
	
	velocity = move_and_slide(velocity, Vector2.UP)
	



