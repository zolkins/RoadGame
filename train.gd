extends KinematicBody2D

export (int) var speed = 500

var velocity = Vector2()

# Автобус двигается до координаты x
var i = 0

#func _ready():
	# Начальная позиция автобуса
	#position = Vector2(1522, 40)
	#pass

# Начало движения
func move():
	velocity.x = -speed
#	print(position.x)

func _physics_process(delta):
	if position.x >= 400:
		move()
	else:
		move()
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

