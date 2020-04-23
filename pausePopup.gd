extends WindowDialog

func _ready():
	
	get_tree().paused=true
	$ItemsButton.grab_focus()
	
func _input(event):
	if Globals.inventoryIsOpen && event.is_action_pressed("pause"):
		Globals.inventoryIsOpen = false
	
	elif event.is_action_pressed("pause"):
		Globals.inventoryIsOpen = false
		get_tree().paused=false

func _on_ItemsButton_pressed():
	Globals.inventoryIsOpen = true

func _on_QuitButton_pressed():
	get_tree().change_scene("TitleScreen.tscn")
	Globals.inventoryIsOpen = false
	Globals.popup.visible=false
	get_tree().paused=false


func _on_SaveButton_pressed():
	print("Save game")
	var packed_scene = PackedScene.new()
	packed_scene.pack(get_tree().get_current_scene())
	ResourceSaver.save("res://my_scene.tscn", packed_scene)
