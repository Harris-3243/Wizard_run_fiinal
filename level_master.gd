extends Node2D

func _ready():
	pass

func _enter_tree():
	# resets the checkpoint location
	if Checkpoint.last_position:
		$player.global_position = Checkpoint.last_position


func _physics_process(_delta):
	
	if Input.is_action_just_pressed("reset"):
		
		if Checkpoint.level == 1:
			get_tree().change_scene("res://Level1.tscn")
			Checkpoint.deaths +=1
				#print(Checkpoint.deaths)
		elif Checkpoint.level == 2:
			get_tree().change_scene("res://Level2.tscn")
			Checkpoint.deaths +=1
				#print(Checkpoint.deaths)
		else:
			get_tree().change_scene("res://Level3.tscn")
			Checkpoint.deaths +=1
				#print(Checkpoint.deaths)
			
			
