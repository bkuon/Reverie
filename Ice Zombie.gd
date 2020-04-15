extends Area2D

var can_speak = true
var can_interact = false

func _ready():
	$Oneliner.hide()

func _physics_process(delta):
	#$AnimatedSprite.set_speed_scale(2)
	$AnimatedSprite.play()
	var bodies = get_overlapping_bodies()

func _on_Ice_Zombie_body_entered(body):
	var random = randi() % 100
	$Oneliner.show()
	if random <= 49:
		$audio1.play()
	else:
		$audio2.play()
	
func _on_Ice_Zombie_body_exited(body):
	$Oneliner.hide()
