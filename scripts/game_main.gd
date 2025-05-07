extends Node2D

var game_running : bool
var game_over : bool
var scroll
var score
const SCROLL_SPEED : int = 4
var screen_size : Vector2i
const PIPE_DELAY : int = 100
const PIPE_RANGE : int = 200
# Called when the node enters the scene tree for the first time.

func new_game():
	game_running = false
	game_over = false
	score = 0
	scroll = 0
	$bird.reset()
	
func _ready():
	new_game()
	
func start_game():
	game_running = true
	$bird.start_flying = true
	$bird.jump_bird()

func _input(event: InputEvent) -> void:
	if game_over == false:
		#chequejem si s'ha fet click
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				if game_running == false:
					start_game()
				else:
					if $bird.start_flying:
						$bird.jump_bird()
		
		
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
