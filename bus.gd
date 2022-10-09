extends KinematicBody2D


func _ready():
	pass

#Если кто-то сталкивается выключить ему отоброжение
func _on_Area2D_body_entered(body):
	body.visible = false

# Через 11 секунд переместиться влево
func _on_Timer_timeout():
	self.position.x -= 1000

