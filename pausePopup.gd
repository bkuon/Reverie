extends WindowDialog

func _ready():
	get_tree().paused=true
	
func _input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused=false

func _on_save_btn_pressed():
	print("Save game")


func _on_items_btn_pressed():
	print("items menu")


func _on_quit_btn_pressed():
	print("quit game")
