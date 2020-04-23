extends AnimatedSprite
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Ending_tree_entered():
	self.play("wake")


func _on_MC_wakeUp_animation_finished():
	$thankYou.visible=true
