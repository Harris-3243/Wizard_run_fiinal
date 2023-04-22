extends KinematicBody2D


export var speed = 1.6



func _ready():
	pass 




func _on_range_body_entered(body):
	
	if body.name == "player":
		$AnimationPlayer.playback_speed = speed
		$AnimationPlayer.play("wack")


func _on_hit_body_entered(body):
	if $AnimationPlayer.is_playing():
		if body.name == "Tiles Solid":
			$crunch.play()
			
	if Checkpoint.invincible == 0:
		if body.name == "player":
			body.hit(position.x)
			Checkpoint.invincible += 1
			
	elif Checkpoint.invincible != 0:
		yield(get_tree().create_timer(1.0), "timeout")
		Checkpoint.invincible -= Checkpoint.invincible
