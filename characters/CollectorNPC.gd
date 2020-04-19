extends Area2D

var can_speak = true
var can_interact = false
# Before the player can speak to the dolphin, they can't understand them
var dialogueInitial =[
"Oh! Thank goodness you're here!",
"I need your help! Look at my poor painting",
"Some scoundrel ruined it! It looks like a cheap picasso!",
"I can't open the gallery until you fix this",
"If you help me, I'll let you visit the most special painting I own"
]
var dialoguePaintingNotFixed =[
"Please help me! I'll let you visit the most special painting I own!"
]

var dialoguePaintingFixed =[
"You did it! It's perfect!",
"Here you go. Just as promised.",
"Enjoy the painting. You've earned it"
]

var dialogueFinal =[
"There's nothing better than getting lost in beautiful art"
]

func _ready():
	$CollectorSprite.play("default")
	pass
