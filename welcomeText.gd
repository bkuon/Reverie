extends RichTextLabel

var dialog = [
"Hello. I see you've decided to join us here.", 
"I'm glad you arrived safely",
"But...",
"Where are you?",
"Who are you?",
"I don't have the answers you seek",
"But I can give you a memory of who you might be",
"Or who you could have been"]

var canvas_layer = null
var page=0	


var message = null
var start=false
var words

# Called when the node enters the scene tree for the first time.
func _ready():
	canvas_layer = CanvasLayer.new()
	add_child(canvas_layer)
	set_bbcode(dialog[page])
	set_visible_characters(0)

func _input(event):
	if Input.is_action_pressed("ui_accept"):
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size()-1:
				page+=1
				set_bbcode(dialog[page])
				set_visible_characters(0)	
			else:
				
				get_tree().change_scene("res://PersonalityQuiz.tscn")
					
func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
	
			
