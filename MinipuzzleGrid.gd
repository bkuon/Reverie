extends TileMap
export(String, FILE, "*,tscn") var world2

#onready var node = get_node("/root/scene_main_node/node_wanted")

#lbs stands for "list of button states"
#Initialized with strings because it needed to be populated
var lbs = ["1", "2", "3", "4", "5", "6", "7", "8", 
"9", "10", "11", "12", "13", "14", "15", "16"]

var count = Array()

#the list of buttons that we need to turn on to match the combination
var valid_buttons = [0, 2, 3, 4, 6, 8, 9, 11, 12, 13 ,15, 20, 20, 20, 20, 20]

signal won
var t = Timer.new()
onready var doorNode = get_parent().get_node("Door")
signal showdoor

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $MPB1.light == "on":
		lbs[0] = "on"
	else:
		lbs[0] = "off"

	if $MPB2.light == "on":
		lbs[1] = "on"
	else:
		lbs[1] = "off"

	if $MPB3.light == "on":
		lbs[2] = "on"
	else:
		lbs[2] = "off"
	
	if $MPB4.light == "on":
		lbs[3] = "on"
	else:
		lbs[3] = "off"
	
	if $MPB5.light == "on":
		lbs[4] = "on"
	else:
		lbs[4] = "off"
	
	if $MPB6.light == "on":
		lbs[5] = "on"
	else:
		lbs[5] = "off"
	
	if $MPB7.light == "on":
		lbs[6] = "on"
	else:
		lbs[6] = "off"
	
	if $MPB8.light == "on":
		lbs[7] = "on"
	else:
		lbs[7] = "off"
	
	if $MPB9.light == "on":
		lbs[8] = "on"
	else:
		lbs[8] = "off"
	
	if $MPB10.light == "on":
		lbs[9] = "on"
	else:
		lbs[9] = "off"
	
	if $MPB11.light == "on":
		lbs[10] = "on"
	else:
		lbs[10] = "off"
	
	if $MPB12.light == "on":
		lbs[11] = "on"
	else:
		lbs[11] = "off"
	
	if $MPB13.light == "on":
		lbs[12] = "on"
	else:
		lbs[12] = "off"
	
	if $MPB14.light == "on":
		lbs[13] = "on"
	else:
		lbs[13] = "off"
	
	if $MPB15.light == "on":
		lbs[14] = "on"
	else:
		lbs[14] = "off"
	
	if $MPB16.light == "on":
		lbs[15] = "on"
	else:
		lbs[15] = "off"

	if lbs[0] == "on" and lbs[2] == "on" and lbs[3] == "on" and lbs[4] == "on" and lbs[6] == "on" and lbs[8] == "on" and lbs[9] == "on" and lbs[11] == "on" and lbs[12] == "on" and lbs[13] == "on" and lbs[15] == "on":
		#print("you won!")
		emit_signal("won")
	pass



func _on_MinipuzzleGrid_won():
	t.set_wait_time(1)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	t.queue_free()
	#$puzzle_winning_sound.play()
	#if $puzzle_winning_sound.is_playing() == false:
	#print("no more sound")
	emit_signal("showdoor")
	get_tree().change_scene(world2)
	#doorNode.get_child(1)
	print("node is")
	print(doorNode)
