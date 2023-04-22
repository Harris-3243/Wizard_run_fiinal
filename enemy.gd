extends KinematicBody2D
var speed = 70
var velocity = Vector2()
export var direction = -1
export var detects_cliffs = true
var hit_box = true


func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
		$floor_checker.enabled = detects_cliffs

func _physics_process(_delta):
	if is_on_wall() or (not $floor_checker.is_colliding() and detects_cliffs and is_on_floor()):
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction

	
	velocity.y += 20
	
	velocity.x = speed * direction
	
	velocity = move_and_slide(velocity, Vector2.UP)

func _on_top_checker_body_entered(body):
	$AnimatedSprite.play("squash")
	speed = 0
	set_collision_layer_bit(4, false)
	set_collision_mask_bit(0, false)
	$top_checker.set_collision_layer_bit(4, false)
	$top_checker.set_collision_mask_bit(0, false)
	$sides_checker.set_collision_layer_bit(4, false)
	$sides_checker.set_collision_mask_bit(0, false)
	$Timer.start()
	bounce(body)
	$Soundsquash.play()

func bounce(body):
	if body is KinematicBody2D and body.has_method("bounce"):
		body.bounce()

func _on_sides_checker_body_entered(body):
	if Checkpoint.invincible == 0:
		if hit_box and $sides_checker/CollisionShape2D != null and body.has_method("hit"):
			body.hit(position.x)
			$sides_checker/CollisionShape2D.call_deferred("set_disabled", true)
			hit_box = false
			Checkpoint.invincible += 1
	elif Checkpoint.invincible !=0:
		yield(get_tree().create_timer(1.0), "timeout")
		Checkpoint.invincible -= Checkpoint.invincible
		#print(Checkpoint.invincible)


		

		

		



func _on_Timer_timeout():
	queue_free()

