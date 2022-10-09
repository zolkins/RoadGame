extends KinematicBody2D

export (int) var speed = 300

var velocity = Vector2()
# Ходьба
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

# Анимация
onready var _animated_sprite = $AnimatedSprite
func _process(_delta):
	if velocity.length() != 0:
		_animated_sprite.play("run")
	else:
		_animated_sprite.stop()

# Перемещение
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

	


