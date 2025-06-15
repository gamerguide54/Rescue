extends Node2D

signal time

func _ready():
	pass


func _physics_process(delta):
	if Input.is_action_just_pressed("restartlevel"):
		get_tree().change_scene("res://World.tscn")



func _on_Timer_timeout():
	emit_signal("time")


func _on_side_hit_s_player_entered(body):
	print("side hit")
