extends Control

var people = [0, 0, 0, 0, 0, 0, 0]
var names = ["Joshua", "Aram", "Brandon", "Cierra", "Luna", "Patrick", "Kendall"]
var companions = ["BookFollower", "AppleFollower", "TigerFollower", "CatNPC", "CupcakeFollower", "ControllerFollower", "TurtleFollower"]
var button1list = ["06", "0", "0", "0", "014"]
var button2list = ["15", "1", "1", "1", "23"]
var button3list = ["23", "2", "24", "2", "56"]
var button4list = ["4", "3", "3", "3"]
var button5list = ["", "4", "5", "4"]
var button6list = ["", "5", "6", "5"]
var quizQuestions = ["What is your favorite color?", "What is your favorite sport?", "What quality makes someone a good leader?",
"If you had a superpower what would it be?", "What is your favorite season?"]
var answers = []
var index = 0
onready var globals = get_node("/root/Globals")


# 0 - Josh, 1 - Aram, 2 - Brandon, 3 - Cierra, 4 - Luna, 5 - Patrick, 6 - Kendall
func _ready():
	answers.append(["Blue", "Green", "Purple", "Pink"])
	answers.append(["Yoga", "Basketball", "Boxing", "Soccer", "Fencing", "Video Games", "Bowling"])
	answers.append(["Wisdom", "Caring", "Empathy", "Creativity", "Reason", "Decisiveness"])
	answers.append(["Rewind Time", "Teleportation", "Telepathy", "Being Rich", "Pause Time", "Flight", "Glow in the dark hands"])
	answers.append(["Spring", "Summer", "Fall"])
	get_node("Button").visible = false
	get_node("Button8").visible = false
	prepareQuestion()
	
	
func prepareQuestion():
	if(index < 5):
		get_node("Label").text = quizQuestions[index]
		# hide all options
		hideButtons()
		for n in range(answers[index].size()):
			if(answers[index][n]):
				get_node("Options/Button" + str(n+1)).visible = true
				get_node("Options/Button" + str(n+1)).text = str(answers[index][n])
	else:
		#all questions answered, get tally
		var mostAnswers = 0
		var personIndex
		for n in range(7):
			if(people[n] > mostAnswers):
				mostAnswers = people[n]
		for n in range(7):
			if(people[n] == mostAnswers):
				personIndex = n
				setCompanion(n)

func hideButtons():
	for n in range(1,8):
			get_node("Options/Button" + str(n)).visible = false

func setCompanion(n):
	var personName = names[n]
	var companion = "res://images/NPC/" + companions[n] +"/pq.png"
	hideButtons()
	get_node("Label").visible = false
	get_node("Label2").text = "Your answers were most like " + personName + "!"
	get_node("Button").visible = true
	get_node("Button8").visible = true
	get_node("Sprite").set_texture(load(companion))
	globals.setCompanion(companions[n])

func _on_Button1_pressed():
	for n in button1list[index].length():
		var i = int(button1list[index][n])
		people[i] = people[i] + 1
	index = index + 1
	prepareQuestion()


func _on_Button2_pressed():
	for n in button2list[index].length():
		var i = int(button2list[index][n])
		people[i] = people[i] + 1
	index = index + 1
	prepareQuestion()

func _on_Button3_pressed():
	for n in button3list[index].length():
		var i = int(button3list[index][n])
		people[i] = people[i] + 1
	index = index + 1
	prepareQuestion()

func _on_Button4_pressed():
	for n in button4list[index].length():
		var i = int(button4list[index][n])
		people[i] = people[i] + 1
	index = index + 1
	prepareQuestion()

func _on_Button5_pressed():
	for n in button5list[index].length():
		var i = int(button5list[index][n])
		people[i] = people[i] + 1
	index = index + 1
	prepareQuestion()

func _on_Button6_pressed():
	for n in button6list[index].length():
		var i = int(button6list[index][n])
		people[i] = people[i] + 1
	index = index + 1
	prepareQuestion()

func _on_Button7_pressed():
	var pindex = 6
	people[pindex] = people[pindex] + 1
	index = index + 1
	prepareQuestion()

func _on_Button_pressed():
	get_tree().change_scene("world.tscn")


func _on_Button8_pressed():
	get_tree().change_scene("PersonalityQuiz.tscn")
