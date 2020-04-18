#Door.gd
extends Area2D

export(String, FILE, "*,tscn") var world_scene
export(String) var currentRoom
export(String) var previousRoom
export(String) var nextRoom

const LOAD_MC = preload("res://MC_Sprite.tscn")
var loadMC = null


#var canvas_layer = null

func spawnMC(loadMC):
	loadMC = LOAD_MC.instance()
	print("MC's current room: ", currentRoom)
	print("MC's previous room: ", MC_Globals.previousRoom)
	MC_Globals.destination = self.get_position()
	if MC_Globals.previousRoom == nextRoom:
		print("MC Spawns at: ", MC_Globals.destination)
		loadMC.position=MC_Globals.destination
		
		
func _on_LevelZero_Start_tree_entered():

	spawnMC(loadMC)
	


func _on_LevelZero_Hall_tree_entered():
	spawnMC(loadMC)
	
	
	
func _on_LevelZero_Lobby_tree_entered():
	spawnMC(loadMC)
	
	
func _physics_process(delta):

					
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "MC_Sprite":
			#Save MC's last position in current scene
			if Input.is_action_just_pressed("enter_door"):

				#print(MC_Globals.destination)
				#Change scene
				get_tree().change_scene(world_scene)	
				MC_Globals.previousRoom= currentRoom

