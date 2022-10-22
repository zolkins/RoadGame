extends KinematicBody2D

export (int) var speed = 200
onready var _animated_sprite = $animated_sprite
var velocity = Vector2()
var walk:bool

func _ready():
	position.x = 709
	position.y = 671
	Global.hide = false

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
	if velocity.length() == 0 and Global.lavochka == false:
		_animated_sprite.play("idle")
	velocity = velocity.normalized() * speed
	move_and_slide(velocity)

func _process(_delta):
	if velocity.x != 0 or velocity.y != 0:
		walk = true
	else:
		walk = false
	if walk and !Global.death:
		if !$AudioStreamPlayer.is_playing():
			$AudioStreamPlayer.play()
	else:
		$AudioStreamPlayer.stop()
	if Global.hide:
		Global.death = false
		position.x = -1000
		position.y = -1000
		return
	if Global.lavochka:
		_animated_sprite.play("idle_down")
	if Global.death:
		_animated_sprite.play("dead")
		Global.score = 0
		return
	move()


func _on_lavochka_body_entered(body):
	Global.lavochka = true

func _on_lavochka_body_exited(body):
	Global.lavochka = false
