extends KinematicBody2D

export (int) var speed = 300
onready var _animated_sprite = $animated_sprite
var velocity = Vector2()

# Ходьба
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
		_animated_sprite.play("walk_right")
	if Input.is_action_pressed("left"):
		_animated_sprite.play("walk_left")
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if velocity.length() == 0:
		_animated_sprite.play("idle")
	else:
		velocity = velocity.normalized() * speed
	move_and_slide(velocity)

# Анимация
func _process(_delta):
	# Анимация ходьбы в разные стороны если нажата клавиша ходьбы
#	if Input.is_action_pressed("right"):
#		_animated_sprite.play("right")
#		print("БЛЯЯЯЯЯЯЯЯТЬ")

	get_input()
#	# Если x = 0 и y = 0 играть анимацию idle
#	if (velocity.x + velocity.y) == 0:
#		_animated_sprite.play("idle")
## Если x > 1 играть анимацию walk_left
#	if velocity.x < 1:
#		_animated_sprite.play("walk_left")
## Если x < 1 играть анимацию walk_right
#	if velocity.x > 1:
#		_animated_sprite.play("walk_right")
### Если y > 1 играть анимацию walk_down
##	if velocity.y > 1:
##		_animated_sprite.play("walk_down")
### Если y < 1 играть анимацию walk_up
##	if velocity.y < 1:
##		_animated_sprite.play("walk_up")

