extends StaticBody2D

@export var ground_vel: float = 300.0
const BACKGROUND_WIDTH := 434.0

func _process(delta):
	if get_parent().game_running:
		position.x -= delta * ground_vel
		if position.x <= -BACKGROUND_WIDTH:
			position.x += BACKGROUND_WIDTH
		
	

		
	
	
	
