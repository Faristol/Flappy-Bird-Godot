extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
const GRAVITY = 900.0
const MAX_VEL = 600
const JUMP_FORCE = -500.0
const START_POS = Vector2(100,400)
var start_flying :bool = false
func _ready():
	reset()
	
func reset():
	start_flying = false
	position = START_POS
	set_rotation(0)
	
func _physics_process(delta: float) -> void:
	if start_flying:
		velocity.y += GRAVITY * delta
		#quan "caiga" cesar la animacio
		if velocity.y > MAX_VEL:
			velocity.y = MAX_VEL
		if velocity.y > 0:
			_animated_sprite.stop()
			set_rotation(deg_to_rad(velocity.y*0.05))
		else:
			_animated_sprite.play("flying")
			set_rotation(deg_to_rad(velocity.y*0.05))
		move_and_slide()	

func jump_bird():
	velocity.y = JUMP_FORCE
