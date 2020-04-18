extends Area2D

var can_speak = true
var can_interact = false

var dialogueInitial =[
"Who might you be?",
#MC: "I don't know"
"Ah! For shame! One should have a sense of who they are",
"I, for instance, am an artist of the highest caliber",
"Yet, I cannot paint! I have no paint",
"for I am both the painter and the paint!",
"Ah! What bitter irony! Such is life, my dear visitor",
"I truly wish you the best"]

#Before MC brings them the paint and brush
var dialogueBeforePaint=["He's busy ranting about something"]

var dialogueAfterPaint=[
"Do my eyes mistake me? Is that what it seems?",
"Paint! It is paint and a brush!",
"Please, dear visitor, allow me to take these things from you",
"I shall let you select the topic of my next masterpiece"
]
# If MC says anything other than "A key for a soul"
var responseToWrongAnswer=[
"I must apologize, for I do not know what that is."]

var responseToRightAnswer=[
"Brilliant! I shall begin my work this instant!"]

func _ready():
	pass # Replace with function body.

