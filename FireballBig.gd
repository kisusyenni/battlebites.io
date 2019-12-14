extends Area2D

const SPEED = 180
var velocity = Vector2()
var direction = 1

func _ready():
	pass

func set_fireball_direction(dir):
	direction = dir 
	if dir == -1:
		$AnimatedSprite.flip_h = true

func _physics_process(delta):
	velocity.x = SPEED * delta * direction 
	translate(velocity)
	$AnimatedSprite.play("default") 



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_FireballBig_body_entered(body):
	if "Hotdog" in body.name:
		body.dead(1000)
	if "Fries" in body.name:
		body.dead(1000)
	if "burger" in body.name:
		body.dead(1000)
	if "pizza" in body.name:
		body.dead(1000)
	if "softdrink" in body.name:
		body.dead(1000)
	queue_free()
