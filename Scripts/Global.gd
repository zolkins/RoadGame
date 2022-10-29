extends Node2D

onready var death:b = false
onready var score = 0
onready var hide = false
onready var lavochka:bool
onready var h_score:int

func _process(delta):
	if score >= h_score:
		h_score = score

func _input(event):
	if Input.is_action_pressed("esc"):
		OS.set_window_fullscreen(false)
	if Input.is_action_pressed("ui_accept"):
		OS.set_window_fullscreen(true)

func scene(target: String) -> void:
	#$Control/AnimationScene.play("Open")
	#yield($Control/AnimationScene, "animation_finished")
	get_tree().change_scene(target)
	#$Control/AnimationScene.play_backwards("Open")
