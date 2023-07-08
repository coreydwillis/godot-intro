extends Sprite2D

var pos: Vector2 = Vector2.ZERO
var test_scale: float = 1
const speed: float = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pos = Vector2(300,200)
	position = pos
#	var test_rotation = 45
#	rotation_degrees = test_rotation

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pos.x += speed * delta
	position = pos
#	test_scale += 0.01
#	scale = Vector2(test_scale, test_scale)
