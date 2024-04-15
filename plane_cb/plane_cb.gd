extends CharacterBody2D

const GRAVITY: float = 1000.0
const POWER: float = -400.0

@onready var animation_player = $AnimationPlayer # ctrl drag this over from scene
@onready var animated_sprite_2d = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	
	fly()
	move_and_slide()
	
	if is_on_floor() == true:
		die()

func fly() -> void:
	if Input.is_action_just_pressed("fly") == true:
		velocity.y = POWER
		animation_player.play("fly")

func die() -> void:
	animated_sprite_2d.stop()
	set_physics_process(false) # saves us some computation



# Idea box
	# avoid other planes instead of pipes
	# become tiny
	# become fast
	# shoot at pipe (free pass)
	# try to catch all things or else you lose
	# fuel box, try to refuel at a good pace
	# view change, now you're playing galatica lol plane turns into spaceship and goes into space
	# Tappy surprise
