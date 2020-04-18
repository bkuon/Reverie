extends StaticBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	$RedKeyButton.visible = false
	$BlueKeyButton.visible = false
	$QuitShoppingButton.visible = false
	
	pass # Replace with function body.

onready var globals = get_node("/root/Globals")

var event
var priceToPay = 0
var itemToAdd = ""

var greeting = "Hey! Buy somethin' will ya! (Press Z to browse)"
var sellStuff = "Here's what I've got:"
var coinError = "Better go get some more money dude!"
var confirm = "You sure bud? (Press Z to confirm or C to cancel)"
var soldMessage = "Awesome! Need anything else?"
var goodbye = "Thanks for shoppin'! Smell ya later!"

var greeted = false
var selection = false

func _input(event):
	if event is InputEventKey:
		if event.pressed:
			if event.scancode == KEY_Z:
				var bodies = $Stand.get_overlapping_bodies()
				for b in bodies:
					if b.name == "MC_Sprite":
						if greeted == false:
							$Speech.text = greeting
							greeted = true
						elif greeted == true:
							$Speech.text = sellStuff
							$RedKeyButton.visible = true
							$BlueKeyButton.visible = true
							$QuitShoppingButton.visible = true
						if selection == true:
							globals.addToInventory(itemToAdd)
							globals.coinCounter -= priceToPay
							$Speech.text = soldMessage
							selection = false
			elif event.scancode == KEY_C:
				var bodies = $Stand.get_overlapping_bodies()
				for b in bodies:
					if b.name == "MC_Sprite":
						if selection == true:
							$Speech.text = sellStuff
							selection = false

func _on_RedKeyButton_button_down():
	if globals.coinCounter >= 10:
		selection = true
		$Speech.text = confirm
		priceToPay = 10
		itemToAdd = "redkey"
	else:
		$Speech.text = coinError
	pass # Replace with function body.

func _on_BlueKeyButton_button_down():
	if globals.coinCounter >= 5:
		selection = true
		$Speech.text = confirm
		priceToPay = 5
		itemToAdd = "bluekey"
	else:
		$Speech.text = coinError
	pass # Replace with function body.

func _on_QuitShoppingButton_button_down():
	$RedKeyButton.visible = false
	$BlueKeyButton.visible = false
	$QuitShoppingButton.visible = false
	$Speech.text = goodbye
	greeted = false
	pass # Replace with function body.
