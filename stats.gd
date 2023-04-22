extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var label = $time3
onready var label2 = $Label3
onready var label3 = $Label4

# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = "Time: " + str(Checkpoint.time_string)
	label2.text = "Deaths: " + str(Checkpoint.deaths)
	label3.text = "Coins Collected:" +str(Checkpoint.save_coins+((Checkpoint.save_scroll*5)-(Checkpoint.found_scroll*5)))

func _physics_process(_delta):
	Checkpoint.timer_start = false
	
	if Input.is_action_just_pressed("reset"):
		TransformationScreen.change_scene("res://main menu.tscn")
		Checkpoint.change = 0
		Checkpoint.last_position = null
		Checkpoint.time = 0
		Checkpoint.ft = 0.0
		Checkpoint.time_string = 0
		Checkpoint.save_coins = 0
		Checkpoint.change_coins = 0
		Checkpoint.level = 0
		Checkpoint.save_scroll = 0
		Checkpoint.change_scroll = 0
		Checkpoint.collect = false
		Checkpoint.timer_start = false
		Checkpoint.deaths = 0
		Checkpoint.invincible = 0
		Checkpoint.found_scroll = 0

func _process(_delta):
	label.text = "Time: " + str(Checkpoint.time_string)
	label2.text = "Deaths: " +str(Checkpoint.deaths)
