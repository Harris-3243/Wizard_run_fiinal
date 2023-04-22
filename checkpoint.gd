extends Node 
var change = 0
var last_position = null
var time = 0
var ft : float =  0.0
var time_string = 0
var save_coins = 0
var change_coins = 0
var level = 0
var save_scroll = 0
var change_scroll = 0
var collect = false
var timer_start = false
var deaths = 0
var is_touching_enemy = false
var invincible = 0
var found_scroll = 0



# timer func made it so that every milisec, the time +=1
func _process(delta: float) -> void:
	if timer_start:
		ft += delta

		var minutes := ft/60
		var seconds:= fmod(ft,60)
		var msec := fmod(ft,1)*10
		time_string = "%1d:%02d.%01d" % [minutes, seconds, msec]
	
	#print(Checkpoint.timer_start)




