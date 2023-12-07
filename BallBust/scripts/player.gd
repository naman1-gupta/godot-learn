extends Area2D

@export var speed = 400
var viewport_size = 0
var bullet

@export var fire_delay_timer:  Timer;
@export var fire_rate_per_minute: int = 100;
var fire_delay

signal game_over

func _ready():
	hide()
	viewport_size = get_viewport_rect().size
	bullet = preload("res://assets/prefabs/bullet.tscn")
	fire_delay = float(60) / fire_rate_per_minute
	print("speed: %s, Fire delay: %s, Fire Rate: %s" % [speed, fire_delay, fire_rate_per_minute])


func _process(delta):
	move(delta)
	fire()

func move(delta):
	var velocity = Vector2.ZERO

	if Input.is_action_pressed("move_left"):
		velocity.x = -1
	elif Input.is_action_pressed("move_right"):
		velocity.x = 1
		
	if velocity.length() > 0:
		# print(velocity, velocity.normalized())
		velocity = velocity.normalized() * speed
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, viewport_size)
	
func fire():
	if Input.is_action_pressed("fire") and fire_delay_timer.is_stopped():
		fire_delay_timer.start(fire_delay)
		var inst = bullet.instantiate()
		add_child(inst)

func die():
	self.queue_free()
	get_tree().paused = true
	game_over.emit()
	# $GameOver.text = 'GameOver';

func _on_body_entered(body):
	# print(body, body.get_groups())
	if "enemy" in body.get_groups():
		die()
