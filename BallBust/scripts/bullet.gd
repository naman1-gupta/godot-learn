extends Area2D

@export var velocity: int = 1000
@export var damage: int = 1

func _process(delta):
	set_position(
		Vector2(
			self.position.x, 
			self.position.y - (delta * velocity)
		)
	)
	
func _on_body_entered(body:Node2D):
	# print("Entered: %s" % body)
	self.queue_free()
	body.hit(damage)