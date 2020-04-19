

extends Area2D
#export(String, FILE, "*,tscn") var spike_scene
export (PackedScene) var Spike

func _ready():
	$Label.hide()
	$EnemyPuzzle3Timer.set_wait_time(3)
	$EnemyPuzzle3Timer.start()
	$EnemyPuzzle3Timer.is_one_shot() == true

func _physics_process(delta):
	$AnimatedSprite.set_speed_scale(2)
	$AnimatedSprite.play()
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "MC_Sprite":
			$Label.show()
	
	if $EnemyPuzzle3Timer.get_time_left() < 0.1:
		$Label.hide()
	


#func _on_Spike_Timer_timeout():
#	$SpikePath/SpikeSpawnLocation.offset = randi()
#	var spike = Spike.instance()
#	add_child(spike)
#	var timer = $SpikeTimer.has_autostart()
#	print(timer)
#	var direction = $SpikePath/SpikeSpawnLocation.rotation + PI / 2
#	spike.position = $SpikePath/SpikeSpawnLocation.position
#	direction += rand_range(-PI / 4, PI / 4)
#	spike.rotation = direction
#	spike.linear_velocity = Vector2(rand_range(spike.min_speed, spike.max_speed), 0)
#	spike.linear_velocity = spike.linear_velocity.rotated(direction)
