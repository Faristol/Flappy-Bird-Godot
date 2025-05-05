extends CharacterBody2D

const GRAVITY = 900.0
const JUMP_FORCE = -300.0
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
	move_and_slide()
