extends Node2D

onready var death = false
onready var score = 0
onready var hide = false
onready var lavochka:bool

	
func _ready():
	pass 

func scene(target: String) -> void:
	#$Control/AnimationScene.play("Open")
	#yield($Control/AnimationScene, "animation_finished")
	get_tree().change_scene(target)
	#$Control/AnimationScene.play_backwards("Open")
