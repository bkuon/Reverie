extends StaticBody2D

func _process(delta):
	
	var bodies = $runItem.get_overlapping_bodies()
	
	for b in bodies:
		if b.name == "MC_Sprite":
			$runItem/runItemSprite.visible=false
			$Label.visible=true
			MC_Globals.canRun=true
			MC_Globals.victory=true
			
			if MC_Globals.isRunning:
				$Label.visible=false
				queue_free()
	pass
	
