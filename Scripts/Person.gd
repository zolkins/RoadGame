extends KinematicBody2D

export (int) var speed = 200
onready var _animated_sprite = $animated_sprite
var velocity = Vector2()


# Ходьба
func move():
	# Запретить нажатие более одной клавиши однавременно
#	if Input.is_action_pressed("right") and Input.is_action_pressed("up") or Input.is_action_pressed("right") and Input.is_action_pressed("down") or Input.is_action_pressed("left") and Input.is_action_pressed("up") or Input.is_action_pressed("left") and Input.is_action_pressed("down"):
#		return
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
		_animated_sprite.play("walk_right")
	if Input.is_action_pressed("left"):
		_animated_sprite.play("walk_left")
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		_animated_sprite.play("walk_down")
		velocity.y += 1
	if Input.is_action_pressed("up"):
		_animated_sprite.play("walk_up")
		velocity.y -= 1
	if velocity.length() == 0:
		_animated_sprite.play("idle")
	velocity = velocity.normalized() * speed
	move_and_slide(velocity)

func _process(_delta):
	if Global.death:
		_animated_sprite.play("dead")
		return
	move()

