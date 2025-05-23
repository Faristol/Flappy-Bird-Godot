extends Node2D

@export var pipe_scene : PackedScene
var game_running : bool
var game_over : bool
var scroll
var score
const SCROLL_SPEED : int = 4
var screen_size : Vector2i
var ground_height : int
var pipes : Array
const PIPE_DELAY : int = 100
const PIPE_RANGE : int = 200
# Called when the node enters the scene tree for the first time.

func new_game():
	game_running = false
	game_over = false
	score = 0
	scroll = 0
	pipes.clear()
	generate_pipes()
	$bird.reset()
	
func _ready():
	screen_size = get_window().size
	ground_height = $ground.get_node("Sprite2D").texture.get_height()
	new_game()
	
func start_game():
	game_running = true
	$bird.start_flying = true
	$bird.jump_bird()
	$PipeTimer.start()

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
	#anem augmentat l'escroll fins que siga igual o major que la pantalla
	if game_running:
		scroll += SCROLL_SPEED
		if scroll >= screen_size.x:
			scroll = 0
		#apliquem l'scroll en negatiu per a que el sol vaja cap a l'esquerra
		#i done l'efecte de q avançem
		$ground.position.x = -scroll
		for pipe in pipes:
			pipe.position.x -= SCROLL_SPEED


func _on_pipe_timer_timeout() -> void:
	generate_pipes()

func generate_pipes():
	var pipe = pipe_scene.instantiate()
	pipe.position.x = screen_size.x + PIPE_DELAY
	pipe.position.y = (screen_size.y - ground_height) / 2 + randi_range(-PIPE_RANGE,PIPE_RANGE)
	pipe.hit.connect(bird_hit)
	add_child(pipe)
	pipes.append(pipe)

func bird_hit():
	pass
