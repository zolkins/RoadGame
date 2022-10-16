extends KinematicBody2D

export (int) var speed = 900
var velocity = Vector2()

# Автобус двигается до координаты x
var i = 0

# Запуск таймера
func _ready():
	# Начальная позиция автобуса
	position = Vector2(1721, 131)
	$Timer.start(rand_range(1, 5))

# Начало движения
func move():
	if position.x <= -447:
		$Timer.start(rand_range(1, 10))
		position = Vector2(1721, 131)
	velocity.x = -speed

func _physics_process(delta):
	position += velocity * delta

func _on_Timer_timeout():
	move()


func _on_ded_body_entered(body):
	if body.name == "body":
		Global.death = true
	
