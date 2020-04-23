extends StaticBody2D

func _process(delta):
	
	var bodies = $OgreItemArea.get_overlapping_bodies()
	
	for b in bodies:
		if b.name == "MC_Sprite":
			$OgreItemArea/keyObject/Sprite.visible=false
	pass
	
