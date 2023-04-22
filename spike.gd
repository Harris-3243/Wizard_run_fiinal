extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_spike_body_entered(body):
	if Checkpoint.invincible == 0:
		if body.name == "player":
			body.hit(position.x)
			Checkpoint.invincible += 1
	elif Checkpoint.invincible !=0:
		yield(get_tree().create_timer(1.0), "timeout")
		Checkpoint.invincible -= Checkpoint.invincible
	else:
		pass
		

		
