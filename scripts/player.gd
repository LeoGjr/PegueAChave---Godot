extends KinematicBody2D

var vel = 100
var key = false
var proximo_chave = false
var porta = false
onready var chave = get_parent().get_node("chave")
onready var node_porta = $"../porta2" 
func _ready():
	pass

func _process(delta):
	var dir = Vector2(0,0)
	if Input.is_action_pressed("up"):
		dir.y = -1
		
	if Input.is_action_pressed("down"):
		dir.y = 1
	
	if Input.is_action_pressed("left"):
		dir.x = -1
		
	if Input.is_action_pressed("right"):
		dir.x = 1
		
	move_and_slide(dir * vel)

func _input(event):
	if key and proximo_chave and Input.is_key_pressed(KEY_X):
		chave.queue_free()
		proximo_chave = false
		
	if porta and key and Input.is_key_pressed(KEY_X):
		node_porta.queue_free()


func _on_area_body_entered(body):
	if body.name == "chave":
		proximo_chave = true
		key = true
		
	if body.name == "porta2":
		porta = true


func _on_area_body_exited(body):
	if body.name == "porta2":
		porta = false
