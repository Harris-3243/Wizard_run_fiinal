extends Node2D

var entered = 0

onready var text_1 = $Label
onready var text_2 = $Label2

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# Show text based on initial value of entered
	if entered == 0:
		text_1.visible = true
		text_2.visible = false
	if entered == 1:
		text_1.visible = true
		text_2.visible = false
	elif entered == 2:
		text_1.visible = false
		text_2.visible = true
	else:
		# Handle invalid values of entered
		pass

func _physics_process(_delta):
	Checkpoint.timer_start = false
	if Input.is_action_just_pressed("ui_accept"):
		entered += 1
		print(entered)
		# Update text visibility based on entered value
		if entered == 0:
			text_1.visible = true
			text_2.visible = false
		if entered == 1:
			text_1.visible = true
			text_2.visible = false
			$AnimationPlayer.play("load")
		elif entered == 2:
			text_1.visible = false
			text_2.visible = true
		else:
			TransformationScreen.change_scene("res://winner.tscn")
			
