
extends Area2D

func _ready():
	$Label.hide()

	$Timer.set_wait_time(3)
	$Timer.start()
	$Timer.is_one_shot() == true


export(String, FILE, "*,tscn") var world_scene

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "MC_Sprite":
			#print("mc touched me")
			$Label.show()
	
	if stepify($Timer.get_time_left(),0.1) == 0.1:
		$Label.hide()
