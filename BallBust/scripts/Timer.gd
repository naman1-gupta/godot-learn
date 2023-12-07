extends Timer

var boulder
var rng;
# Called when the node enters the scene tree for the first time.
func _ready():
	print("Timer ready")
	boulder = preload("res://assets/prefabs/large_boulder.tscn")
	rng = RandomNumberGenerator.new()

func _on_timeout():
	var b = boulder.instantiate()
	b.health = rng.randi_range(100, 1000)
	add_child(b)
