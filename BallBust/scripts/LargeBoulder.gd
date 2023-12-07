extends RigidBody2D


var rng = RandomNumberGenerator.new()
@export var h_speed = 40000
@export var health: int = 100

func _ready():
	var random = rng.randf_range(0, 1) * h_speed
	apply_force(Vector2(random, 0))
	$Health.text = str(health)

func hit(damage: int):
	# print("Hit! %s" % self)
	health -= damage
	if health <= 0:
		self.queue_free()
		return
	
	
	$Health.text = str(health)


