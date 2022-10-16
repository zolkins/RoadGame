extends KinematicBody2D

var speed = -800
var velocity = Vector2()

func _ready():
	randomize()
	position = Vector2(1400, rand_range(216, 504))
	$Timer.start(0.2)
func _on_Area2D_body_entered(body):
	Global.death = true

func move():
	if position.x <= -101:
		$Timer.start(rand_range(1, 3))
		position = Vector2(1400, rand_range(216, 504))
	velocity.x = speed + (rand_range(0, -600))

func _physics_process(delta):
	position += velocity * delta

func _on_Timer_timeout():
	move()

