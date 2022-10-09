extends KinematicBody2D


func _ready():
	pass

#Если кто-то сталкивается выключить ему отоброжение
func _on_Area2D_body_entered(body):
	body.visible = false