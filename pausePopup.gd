extends WindowDialog

func _ready():
	get_tree().paused=true
	
func _input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused=false


	
		
	