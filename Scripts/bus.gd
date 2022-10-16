extends KinematicBody2D

export (int) var speed = 350

var velocity = Vector2()

# Автобус двигается до координаты x
var i = 0
var stop
func _ready():
	randomize()
	stop = rand_range(177, 1100)
	position = Vector2(1522, 63)
	#pass

# Начало движения
func move():
	velocity.x = -speed
#	print(position.x)

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

func _on_Bus_start():
	# Запуск автобуса
	velocity.x = speed
	pass

## Анимация
#onready var _animated_sprite = $AnimatedSprite
#func _process(_delta):
#	if velocity.length() != 0:
#		_animated_sprite.play("run")
#	else:
#		_animated_sprite.stop()

