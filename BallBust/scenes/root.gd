extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func new_game():
	print("Start Game")
	$Player.show()
	$EnemySpawnTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
