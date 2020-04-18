

extends Node

const enemy_spike = preload("res://SpikeBT.tscn")

func _ready():
	spawn()
	pass 

func spawn():
	while true:
		randomize()
		
		var enemy = enemy_spike.instance()
		var pos = Vector2()
		pos.x = rand_range(0-20, get_viewport().get_visible_rect().size.x-20)
		pos.y = 150
		enemy.set_position(pos)
		get_node("container").add_child(enemy)
		yield(get_tree().create_timer(rand_range(1.5,2.25)), "timeout")
	pass