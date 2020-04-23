extends TileMap
export(String, FILE, "*,tscn") var level3

#onready var node = get_node("/root/scene_main_node/node_wanted")

#lbs stands for "list of button states"
#Initialized with strings because it needed to be populated
var lbs = ["11"]
var spawner_count
var correct_button
var count = Array()

#the list of buttons that we need to turn on to match the combination
#var valid_buttons = [11]

signal won
var t = Timer.new()
onready var doorNode = get_parent().get_node("Door")
signal showdoor

# Called when the node enters the scene tree for the first time.
func _ready():
	correct_button = $MPB11
	print(correct_button)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if correct_button.light == "on":
		lbs[0] = "on"
	else:
		lbs[0] = "off"


	if lbs[0] == "on":
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
	get_tree().change_scene(level3)
	#doorNode.get_child(1)
	print("node is")
	print(doorNode)


func _on_lock2keypadgrid_won():
	#t.set_wait_time(1)
	#t.set_one_shot(true)
	#self.add_child(t)
	#t.start()
	#t.queue_free()
	#$puzzle_winning_sound.play()
	#if $puzzle_winning_sound.is_playing() == false:
	#print("no more sound")
	emit_signal("showdoor")
	get_tree().change_scene(level3)
	#doorNode.get_child(1)
	print("node is")
	print(doorNode)
