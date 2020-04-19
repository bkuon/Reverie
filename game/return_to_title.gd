extends Control




func _on_Button_pressed():
	get_tree().change_scene('res://TitleScreen.tscn')


func _on_CheckBox_pressed():
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
	pass # Replace with function body.


func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(0, value)
	pass # Replace with function body.


func _on_Button2_pressed():
	get_tree().change_scene('res://my_scene.tscn')
	pass # Replace with function body.
