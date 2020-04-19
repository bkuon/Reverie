extends WindowDialog

func _ready():
	get_tree().paused=true
	$ItemsButton.grab_focus()
	
func _input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused=false

func _on_ItemsButton_pressed():
	print("items menu")


func _on_QuitButton_pressed():
	print("quit game")


func _on_SaveButton_pressed():
	print("Save game")
	var packed_scene = PackedScene.new()
	packed_scene.pack(get_tree().get_current_scene())
	ResourceSaver.save("res://my_scene.tscn", packed_scene)
