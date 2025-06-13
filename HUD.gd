extends CanvasLayer


var coins = 0
var kills = 0
export var time = 70


func _ready():
	$number.text = String(coins)
	$kills.text = String(kills)
	$time.text = String(time)


func _on_coin_collected():
	coins = coins + 1
	_ready()
	


func _on_enemy_kill_number():
	kills = kills + 1
	_ready()



func _on_World_time():
	time = time -1
	_ready()
	
	
	
	
func _physics_process(delta):
	if time == 0:
		get_tree().change_scene("res://World.tscn")


func _on_stop_pressed():
	get_tree().change_scene("res://TitleMenu.tscn")
