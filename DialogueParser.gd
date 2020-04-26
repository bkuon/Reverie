#

extends Node2D

onready var globals = get_node("/root/Globals")

var dialog_count = -1
var file_path = "res://test_dialogue.json"
var flag_path = "res://flags.json"
var dictionary : Dictionary
var flags : Dictionary
signal done_talking
signal end_encounter
var dialog_obj : String
var picked = false
var obj_name

func _ready():
	dictionary = load_dialog(file_path)
	flags = load_dialog(flag_path)
	
func _physics_process(delta):
	if globals.decided: #if player selected a dialogue choice
		flags[obj_name]["has_choice"] = false
		
		if obj_name == "Enemy Puzzle1" and globals.response == "I'm ready":
			emit_signal("done_talking")
		elif obj_name == "Enemy Puzzle1" and globals.response != "I'm ready":
			flags[obj_name]["start"] = false
			flags[obj_name]["has_choice"] = true
		else:
			#other dialogue
			globals.words = dictionary[obj_name]["choices"][globals.response]
			
		emit_signal("end_encounter")
		globals.decided = false
		#flags[obj_name]["decided"] = true

#checks if object has dialogue or choices. 
func init_dialogue(obj):
	obj_name = obj 
	
	if flags[obj]["has_choice"] and !flags[obj]["decided"]:
		if !flags[obj]["start"]:
			globals.words = Array(dictionary[obj]["start"])
			start_dialog(obj)
			
		else: #give choices
			globals.choices = Array(dictionary[obj]["choices"].keys())
			globals.display_choice = true
			
	elif !flags[obj]["has_choice"] and !flags[obj]["decided"]:
		flags[obj]["decided"] = true
		start_dialog(obj)
		
	else:
		emit_signal("end_encounter")


#initiates DialogueBox through Globals
func start_dialog(obj):
	globals.char_name = obj
	globals.dialogueStart = true
	flags[obj]["start"] = true
	

#loads JSON files as Dictionary
func load_dialog(file_path):
	var file = File.new()
	assert(file.file_exists(file_path))
	file.open(file_path, file.READ)
	var dialog = parse_json(file.get_as_text())
	return dialog
