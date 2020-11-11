extends RigidBody2D

var colliding : bool

const color = [Color.red, Color.green]

func _ready():
	friction = 1.0

func _physics_process(_delta):
	
	colliding = get_colliding_bodies().size() > 0
	modulate = color[int(colliding)]
	
	deform()

func deform():
	var scale_x = 0.2
	var scale_y = 0.6
	var scale_range = 0.1
	var force = get_parent().get_parent().pull.length()
	var deform = clamp((scale_range / 80) * force, 0, scale_range)
	
	$Sprite.scale = Vector2((scale_x - deform), (scale_y + deform))
