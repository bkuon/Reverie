#

extends Node2D

var dialog_count = -1
var file_path = "res://test_dialogue.json"
var flag_path = "res://flags.json"
var dictionary : Dictionary
var flags : Dictionary
signal done_talking
var dialog_obj : String

func _ready():
	dictionary = load_dialog(file_path)
	flags = load_dialog(flag_path)
	get_node("Panel").set_visible(false)

#checks if object has dialogue or choices. choices come after
# "start" dialogue. "decided" tells us if a choice ended
func init_dialogue(obj):
	if !flags[obj]["start"]:
		start_dialog(obj)
	if flags[obj]["has_choice"] and flags[obj]["start"] and !flags[obj]["decided"]:
		make_decision(obj)
	if flags[obj]["decided"]:
		emit_signal("done_talking")
		get_node("Panel").set_visible(false)

#obj name refers to Area2D name. For key: bluekey. for door: doorObj, etc.
#goes through "start" dialogue. 
func start_dialog(obj):
	var convo = Array(dictionary[obj]["start"])
		
	if dialog_obj != obj:
		dialog_count = -1
	
	if dialog_count < convo.size() - 1:
		get_node("Panel").set_visible(true)
		dialog_count += 1
	else:
		get_node("Panel").set_visible(false)
		dialog_count = -1
		flags[obj]["start"] = true
		if !flags[obj]["has_choice"]:
			emit_signal("done_talking")
		
	if dialog_count > -1:
		get_node("Panel/Label").set_bbcode(convo[dialog_count])
		dialog_obj = obj
	

#displays choices with buttons for player
#have to respond with mouse click for now
func make_decision(obj):
	get_node("Panel/Label").clear()
	get_node("Panel").set_visible(true)
	var choices = Array(dictionary[obj]["choices"].keys())
	
	for i in range(0, choices.size()):
		var choiceButton = Button.new()
		choiceButton.set_name("ChoiceButton" + str(i))
		choiceButton.set_text(choices[i])
		get_node("Panel").add_child(choiceButton)
		choiceButton.set_position(Vector2(20 , 10 + 25*i))
		choiceButton.connect("pressed", self, "_on_button_pressed", [choiceButton])

#button pressed signal tells us a reply was picked
func _on_button_pressed(choiceButton):
	clear_buttons()
	get_node("Panel/Label").set_visible(true)
	get_node("Panel/Label").set_bbcode(dictionary[dialog_obj]["choices"][choiceButton.text])
	
#hides the buttons because we don't need them anymore. 
func clear_buttons():
	var panel = get_node("Panel")
	var count = get_node("Panel").get_child_count()
	for i in range(0, count - 1):
		var button = panel.get_node("ChoiceButton" + str(i))
		if button != null:
			button.set_visible(false)
	flags[dialog_obj]["decided"] = true

#loads JSON files as Dictionary
func load_dialog(file_path):
	var file = File.new()
	assert(file.file_exists(file_path))
	file.open(file_path, file.READ)
	var dialog = parse_json(file.get_as_text())
	return dialog
