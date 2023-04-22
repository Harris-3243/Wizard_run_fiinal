extends CanvasLayer

# Declare member variables here. Examples:
onready var selector_one = $CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Label
onready var selector_two = $CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/Label
onready var selector_three = $CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/Label

onready var helpful_quote = $Label2
var current_selection = 0

var quotes = ["""Remember: 
	you need twenty scrolls to win""",     
		 """To maximize your dash, 
		only press the dash button""",              
		"""We know how many 
		times you die""",             
		 """Remember: 
		you are on the clock""",              
		"""Don't die""",             
		 "Blobs aren't friendly",
		"""There is talk about
		a mystical fourth level""",
		""" Timing is everything""",]

func _ready():
	randomize()
	set_current_selection(0)
	set_visible(false)
	
	# Set a random quote when the scene is entered
	helpful_quote.text = quotes[randi() % quotes.size()]

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		set_visible(!get_tree().paused)
		get_tree().paused = !get_tree().paused
		randomize()
		helpful_quote.text = quotes[randi() % quotes.size()]

func set_visible(is_visible):
	for node in get_children():
		node.visible = is_visible
		
func _process(_delta):
	if get_tree().paused:
		if Input.is_action_just_pressed("ui_down"):
			if current_selection < 2:
				current_selection += 1
				set_current_selection(current_selection)
			else:
				current_selection -=2
				set_current_selection(current_selection)

		elif Input.is_action_just_pressed("ui_up" ):
			if current_selection > 0:
				current_selection -= 1
				set_current_selection(current_selection)
			else:
				current_selection +=2
				set_current_selection(current_selection)

		elif Input.is_action_just_pressed("ui_accept"):
			handle_selection(current_selection)

func handle_selection(_current_selection):
	if _current_selection == 0:
		set_visible(!get_tree().paused)
		get_tree().paused = !get_tree().paused
	elif _current_selection == 1:
		set_visible(!get_tree().paused)
		get_tree().paused = !get_tree().paused
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
		
	elif _current_selection == 2:
		get_tree().quit()

func set_current_selection(_current_selection):
	selector_one.text = ""
	selector_two.text = ""
	selector_three.text = ""
	if _current_selection == 0:
		selector_one.text = ">"
	elif _current_selection == 1:
		selector_two.text = ">"
	elif _current_selection == 2:
		selector_three.text = ">"
