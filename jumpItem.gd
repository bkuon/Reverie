extends StaticBody2D

func _process(delta):
	
	var bodies = $jumpItem.get_overlapping_bodies()
	
	for b in bodies:
		if b.name == "MC_Sprite":
			$jumpItem/jumpItemSprite.visible=false
			$Label.visible=true
			MC_Globals.canJump=true
			MC_Globals.victory=true
			
			if MC_Globals.isJumping:
				$Label.visible=false
				queue_free()
	pass
	