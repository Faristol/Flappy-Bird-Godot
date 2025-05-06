extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
const GRAVITY = 900.0
const JUMP_FORCE = -400.0
const START_POS = Vector2(100,400)
func _ready():
	reset()
	
func reset():
	position = START_POS
	set_rotation(0)
	
func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta
	if Input.is_action_just_pressed("space_jump") or Input.is_action_just_pressed("mouse1_jump"):
		velocity.y = JUMP_FORCE
		
		
		
	#quan "caiga" cesar la animacio
	if velocity.y > 0:
		_animated_sprite.stop()
		set_rotation(0.5)
	else:
		_animated_sprite.play("flying")
		set_rotation(-0.5)
	

	move_and_slide()
