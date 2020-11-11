extends Node2D

func _physics_process(_delta):
	update()

func _draw():
	var forehead = get_parent().get_node("Position2D").position
	var input = get_parent().input
	var speed = get_parent().speed
	var pull = get_parent().pull
	var movement = get_parent().movement
	
	draw_line(forehead, forehead + input.normalized()*speed, Color.green)
	draw_line(forehead, forehead + pull, Color.red)
	draw_line(forehead, forehead + movement, Color.yellow)
