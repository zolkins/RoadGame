extends Node2D

onready var death = false
onready var score = 0
onready var hide = false
onready var lavochka:bool
onready var h_score:int

func _process(delta):
	if score >= h_score:
		h_score = score

func scene(target: String) -> void:
	#$Control/AnimationScene.play("Open")
	#yield($Control/AnimationScene, "animation_finished")
	get_tree().change_scene(target)
	#$Control/AnimationScene.play_backwards("Open")
