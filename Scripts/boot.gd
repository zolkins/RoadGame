extends Node2D

onready var end = false

func _ready() -> void:
	randomize()
	$bus.volume_db = 5
	$sfx.volume_db = -15
	$sfx.play(rand_range(0, 30))
	$Tween.interpolate_property($DarkSlow_RG, "position", $DarkSlow_RG.position, Vector2(1543, 261), 2.6, Tween.TRANS_SINE, Tween.EASE_OUT)
	$Tween.start()

	yield(get_tree().create_timer(1.5), "timeout")
	$Tween.interpolate_property($DarkSlow_FL, "position", $DarkSlow_FL.position, Vector2(65, 519), 1, Tween.TRANS_SINE, Tween.EASE_OUT)
	$Tween.start()

	yield(get_tree().create_timer(1), "timeout")
	$Tween.interpolate_property($Bus, "position", $Bus.position, Vector2(633, 581), 1, Tween.TRANS_SINE, Tween.EASE_OUT)
	$Tween.start()
	end = true

func _input(event):
	if end:
		if event is InputEventKey and event.pressed or Input.is_mouse_button_pressed(true):
			end = false
			$sfx.volume_db = -20
			$bus.play()
			$Tween.interpolate_property($DarkSlow_RG, "position", $DarkSlow_RG.position, Vector2(-173, 261), 2.6, Tween.TRANS_SINE, Tween.EASE_OUT)
			$Tween.interpolate_property($DarkSlow_FL, "position", $DarkSlow_FL.position, Vector2(1361, 519), 2.6, Tween.TRANS_SINE, Tween.EASE_OUT)
			$Tween.interpolate_property($Bus, "position", $Bus.position, Vector2(-265, 581), 2, Tween.TRANS_SINE, Tween.EASE_OUT)
			$Tween.start()
			yield(get_tree().create_timer(2), "timeout")
			Global.scene("res://Scenes/Main.tscn")


	
	
