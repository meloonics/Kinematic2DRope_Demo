extends KinematicBody2D

export(int) var idx := 1
var current_player := false
var drag : bool = false

var input := Vector2.ZERO
var pull := Vector2.ZERO
var movement := Vector2.ZERO

const speed = 200

var campath
var rope

func _ready():
	campath = get_parent().get_node("Camera2D").get_path()
	
	current_player = idx == 0
	check_if_current()


func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_focus_next"):
		current_player = !current_player
		check_if_current()
	
	input = Vector2.ZERO
	if current_player:
		input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	if !current_player && !drag:
		pull = Vector2.ZERO
	
	movement = move_and_slide(input.normalized() * speed + pull)


func grab_cam():
	if current_player:
		$RemoteTransform2D.remote_path = campath
	else:
		$RemoteTransform2D.remote_path = ""

func check_if_current():
	grab_cam()
	$Sprite/p.visible = current_player


func _on_CheckBox_toggled(button_pressed):
	drag = button_pressed
