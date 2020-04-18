extends Label

onready var globals = get_node("/root/Globals")
var coins

# Called when the node enters the scene tree for the first time.
func _ready():
	coins = globals.coinCounter
	text = "Coins: " + String(coins)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	coins = globals.coinCounter
	text = "Coins: " + String(coins)
	pass

#func _on_CoinObject_coinCollected():
	#coins = globals.coinCounter
	#text = "Coins: " + String(coins)
