extends RichTextLabel

onready var globals = get_node("/root/Globals")

#var dialog = ["Hello everyone! Thank you for your hard work!",
#"I know that this can be frustrating, but we've learned so much already"]

#dialog needs to have: a character name, text, emotion

var dialog = []
var page=0	

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#Sprint 4 #####################
	if typeof(globals.words) == 4:
		dialog.append(globals.words)
	else:
		dialog = globals.words
	get_node("../CharacterName").set_text(globals.char_name)
	get_node("../CharacterPortrait").texture = globals.char_portrait
	##################################
	
	get_tree().paused=true
		
	set_bbcode(dialog[page])
	set_visible_characters(0)
	
	set_process_input(true)

func _input(event):
	if Input.is_action_pressed("ui_accept"):
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size()-1:
				page+=1
				
				set_bbcode(dialog[page])
				set_visible_characters(0)	
			else:
				get_tree().paused=false
				Globals.dialogue.queue_free()
				Globals.dialogue=null
				Globals.dialogueStart=false
		else:
			#allows for skipping to end of sentence
			set_visible_characters(get_total_character_count())
				
					
func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
	
			
