extends Area2D

var can_speak = true
var can_interact = false
# Statue can't respond until end of level
var dialogueInitial =["................"]
var dialogueCanSpeak =[
"Thank you... I'm the receptionist for this floor...",
"I fell asleep... so someone decided to prank me...",
"Let me give you these as thanks..."
]
#Living Statue gives MC run ability item and the next key
var dialogueFinal =["thanks... again..."]

func _ready():
	$LivingSculptureSprite.play("default")
	pass
