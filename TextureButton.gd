extends TextureButton

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const MAX_SPHERE_MOVE = 60
var Direction = -1
const DIRECTIONS = ['left','right','up','upleft','upright','down','downleft','downright']
var originalCord = Vector2(0,0)
var sprite
var max_position
func _ready():
	sprite = get_node("Sprite")
	originalCord = sprite.position
	max_position = [MAX_SPHERE_MOVE + sprite.position.x,sprite.position.x- MAX_SPHERE_MOVE ,MAX_SPHERE_MOVE + sprite.position.y,sprite.position.y-MAX_SPHERE_MOVE ]
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if sprite.visible:
		var DirectionX = 0
		var DirectionY = 0
		var newCord = get_viewport().get_mouse_position()
		if newCord.x > max_position[1] and newCord.x < max_position[0]:
			sprite.position.x = newCord.x

		if newCord.y > max_position[3] and newCord.y < max_position[2]:
			sprite.position.y = newCord.y

		if newCord.x > originalCord.x: DirectionX = 2
		if newCord.x < originalCord.x: DirectionX = 1
		if newCord.y > originalCord.y +10: DirectionY = 6
		if newCord.y < originalCord.y -10: DirectionY = 3
		if newCord.x > originalCord.x and newCord.x < originalCord.x+10: DirectionX = 0
		if newCord.x < originalCord.x and newCord.x > originalCord.x-10: DirectionX = 0
		if DirectionX ==-0 and DirectionY ==-0: Direction = -1
		else : Direction = DIRECTIONS[DirectionX + DirectionY - 1]
		
			


func _on_TextureButton_button_down():
	sprite.visible = true
func get_direction():
	return Direction

func _on_TextureButton_button_up():
	sprite.visible = false
	sprite.position = originalCord
	Direction = -1
	
