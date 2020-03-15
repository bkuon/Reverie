extends StaticBody2D

func _process(delta):
	
	var bodies = $crawlItem.get_overlapping_bodies()
	
	for b in bodies:
		if b.name == "MC_Sprite":
			$crawlItem/crawlItemSprite.visible=false
			$Label.visible=true
			MC_Globals.canCrawl=true
			MC_Globals.victory=true
			
			if MC_Globals.isCrawling:
				$Label.visible=false
				queue_free()
	pass
	