extends Panel

onready var globals = get_node("/root/Globals")
var choices

func _ready():
	var i = 1;
	choices = globals.choices
	get_node("CharacterPortrait").texture = globals.char_portrait
	get_tree().paused = true
	for c in choices:
		get_node("Option" + str(i)).set_text(c)
		i += 1
		
	$Option1.grab_focus()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		get_tree().paused = false


func _on_Option1_pressed():
	globals.response = $Option1.text
	globals.popup = null;
	globals.display_choice = false
	globals.decided = true
	queue_free()


func _on_Option2_pressed():
	globals.response = $Option2.text
	globals.popup = null;
	globals.display_choice = false
	globals.decided = true
	queue_free()
