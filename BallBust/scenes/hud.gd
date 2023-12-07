extends CanvasLayer
signal start_game

var label;
# Called when the node enters the scene tree for the first time.
func _ready():
	label = $FPSCount


func _on_start_button_pressed():
	print("Restarting...")

	if $GameTitle.text == "Game Over":
		get_tree().reload_current_scene()

	$Button.hide()
	$GameTitle.hide()
	start_game.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	label.text = str(Engine.get_frames_per_second())


func _on_player_game_over():
	$GameTitle.text = "Game Over"
	$Button.text = "Restart?"
	$Button.show()
	$GameTitle.show()
