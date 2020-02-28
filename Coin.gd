extends StaticBody2D

# Declare member variables here. Examples:
onready var globals = get_node("/root/Globals")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var bodies = $Coin.get_overlapping_bodies()
	for b in bodies:
		if b.name == "MC_Sprite":
			print("Picked up Coin")
			globals.coinCounter += 1
			if(globals.coinCounter == 1):
				print("You have " + str(globals.coinCounter) + " coin.")
			elif(globals.coinCounter > 1):
				print("You have " + str(globals.coinCounter) + " coins.")
			queue_free()
	
	pass
