extends Area2D

const SPEED = 230
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
	$AnimatedSprite.play("fireball")

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Fireball_body_entered(body):
	if "Hotdog" in body.name:
		body.dead(1)
	if "Fries" in body.name:
		body.dead(1)
	if "burger" in body.name:
		body.dead(1)
	if "pizza" in body.name:
		body.dead(1)
	if "softdrink" in body.name:
		body.dead(1)
	queue_free()
