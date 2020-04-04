extends Node

var Settings

func _ready():
	Settings = get_node("Settings")
	pass # Replace with function body.

func _input(ev):
	if ev is InputEventKey and ev.scancode == KEY_ENTER and not ev.echo:
		Settings.show()
 	pass

func _on_Button_pressed():
	Settings.hide()
	pass # Replace with function body.

func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(0, value)
	pass # Replace with function body.


func _on_CheckBox_toggled(button_pressed):
    if button_pressed == true:
        AudioServer.set_bus_mute(0,true)
    elif button_pressed == false:
        AudioServer.set_bus_mute(0,false)
