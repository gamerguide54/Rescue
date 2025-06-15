extends KinematicBody2D



func player_entered(body):
	$AnimationPlayer.play("move")
