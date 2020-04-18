extends Area2D

var can_speak = true
var can_interact = false
# Before the player can speak to the dolphin, they can't understand them
var dialogueInitial =["Eie EEEE EieEIE!"]
var dialogueCanSpeak =[
"Hi! Welcome to the lobby!",

"Why are you here? I don't know that!","Why are any of us here?",

"If you want to use the elevator, you need a key.",
"See how the keyhole is shaped like a diamond?",
"That's how you'll know what the key looks like",

"Look, I just work here", 
"I'm sure all your questions will be answered when you get to the third floor",

"I'll let you borrow my spare key",
"Keep this a secret, okay?", 
"Please. I need this job"
]
#Dolphin gives MC the key

var dialogueAfterKey = [
"Here's the key",
"Not all my coworkers are as nice as me, you know!",
"You're going to have to work harder for the key next time.",
"Wait! Before you go, take this!",
]
#MC picks up Jump
var dialogueAfterAbility=[
"I hope you'll find that thing useful.",
"It's an item that lets you jump",
"You'll learn a new ability at the end of each floor",
"Hey. Good luck!"
]

#After MC gets key and Jump, the dolphin will refuse to speak to them
var dialogueFinal =["Eie EEEE EieEIE!"]

func _ready():
	$DolphinSprite.play("default")




















