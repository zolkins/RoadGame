extends KinematicBody2D

export (int) var speed = 350

var velocity = Vector2()
var start = false

# Автобус двигается до координаты x
var i = 0
var stop
func _ready():
	$AnimatedSprite.play("close")
	randomize()
	stop = rand_range(177, 1100)
	position = Vector2(1522, 63)

# Начало движения
func move():
	velocity.x = -speed

func _physics_process(delta):
	if position.x >= stop:
		move()
	else:
		_on_Bus_stop()
	position += velocity * delta


func _on_Bus_stop():
	# Остановка автобуса
	velocity.x = 0
	pass

func _process(delta):
	if start and position.x > -212:
		velocity.x = -speed
		position += velocity * delta
		if position.x > -212:
			yield(get_tree().create_timer(3), "timeout")
			get_tree().reload_current_scene()
	
func _on_door_body_entered(body):
	if body.name == "body":
		$AnimatedSprite.play("open")
		Global.score += 1
		Global.hide = true
		start = true


func _on_door_body_exited(body):
	if body.name == "body":
		$AnimatedSprite.play("close")
		start = true
