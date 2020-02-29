extends RichTextLabel

var dialog = ["Hello everyone! Thank you for your hard work!",
"I know that this can be frustrating, but we've learned so much already"]

#dialog needs to have: a character name, text, emotion

var page=0	

# Called when the node enters the scene tree for the first time.
func _ready():
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
				
					
func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
	
			
