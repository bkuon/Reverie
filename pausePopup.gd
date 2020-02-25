extends WindowDialog

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	if Input.is_action_just_pressed("pause")&& Globals.popup!=null:
		print("If you love me let me go")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
