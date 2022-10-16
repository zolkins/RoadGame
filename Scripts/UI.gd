extends CanvasLayer

var time:int = 10;
onready var score = $Control/Score.text


func _ready():
	show_time()

func _process(delta):
	$Control/Score.text = "Score: " + str(Global.score)
	if Global.lavochka:
		$Control/Timer.start(1)

func show_time() -> void:
	var time_txt
	
	$Control/ColorRect.modulate = Color(1, 1, 1, 1)
	match time:
		3: $Control/ColorRect.modulate = Color(1, 1, 0, 1)
		2: $Control/ColorRect.modulate = Color(1, .75, 0, 1)
		1: $Control/ColorRect.modulate = Color(1, .50, 0, 1)
		0: $Control/ColorRect.modulate = Color(1, .30, 0, 1)

	if time < 10:
		time_txt = "Time: 0" + str(time)
	else:
		time_txt = "Time: " + str(time)

	$Control/Time.text = time_txt


func _on_Timer_timeout():
	if time == 0 or Global.death == true:
		Global.death = true
		yield(get_tree().create_timer(3.0), "timeout")
		Global.death = false
		get_tree().reload_current_scene()
	time -= 1

	show_time()
