extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var hit_box = $hit_1
onready var player_detector = $player_detector
onready var animation_player = $AnimationPlayer

const CHASE_SPEED = 150

var target_player = null
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("idle_flap")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if target_player != null:
		velocity = position.direction_to(target_player.position)
		
		velocity = move_and_slide(velocity* CHASE_SPEED)
		if velocity.x < 0:
			animation_player.play("left_flap ")
		else:
			animation_player.play("right_flap")
		#animation_player.play("idle_flap")
		
	else:
		# Play idle animation
		animation_player.play("idle_flap")
	










func _on_player_detector_body_entered(body):
	if body.name == "player":
		target_player = body


func _on_hit_1_body_entered(body):
	if Checkpoint.invincible ==0:
		if body.name == "player":
			body.hit(position.x)
			Checkpoint.invincible +=1
		
	elif Checkpoint.invincible !=0:
		yield(get_tree().create_timer(1.0), "timeout")
		Checkpoint.invincible -= Checkpoint.invincible
		#print(Checkpoint.invincible)
			
