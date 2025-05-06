extends StaticBody2D

@export var ground_vel: float = 300.0
const BACKGROUND_WIDTH := 434.0
func _process(delta):
	#el piso avança cap a l'esquerra, xaq es cree l'efecte visual
	#q el pardal avança cap a la dreta
	#el background te una amplaria de 434
	#el groun una amplaria de 868
	position.x -= delta * ground_vel
	if position.x <= -BACKGROUND_WIDTH:
		position.x += BACKGROUND_WIDTH
		
	
	
	
