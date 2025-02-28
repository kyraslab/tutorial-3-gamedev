extends CharacterBody2D

@export var gravity = 200.0
@export var walk_speed = 200
@export var jump_speed = -300
@export var dash_speed = 400
@export var dash_duration = 0.2  # Duration of the dash
@export var crouch_speed = 100
@export var crouch_scale = Vector2(1, 0.5)

var is_dashing = false
var is_crouching = false
var jump_count = 0
var dash_timer = 0.0
var dash_cooldown = 0.5  # Cooldown between dashes
var dash_cooldown_timer = 0.0

func _ready():
	pass

func _physics_process(delta):
	# Apply gravity
	velocity.y += delta * gravity

	# Dash Timer Logic
	if dash_timer > 0:
		dash_timer -= delta  # Decrease dash time
		is_dashing = true
	else:
		is_dashing = false

	# Dash Cooldown Logic
	if dash_cooldown_timer > 0:
		dash_cooldown_timer -= delta  # Decrease cooldown timer

	# Movement Logic
	if Input.is_action_pressed("ui_left"):
		if is_dashing:
			velocity.x = -dash_speed  # Dash to the left
		elif is_crouching:
			velocity.x = -crouch_speed
		else:
			velocity.x = -walk_speed
	elif Input.is_action_pressed("ui_right"):
		if is_dashing:
			velocity.x = dash_speed  # Dash to the right
		elif is_crouching:
			velocity.x = crouch_speed
		else:
			velocity.x = walk_speed
	else:
		velocity.x = 0

	# Jumping Logic
	if is_on_floor():
		jump_count = 0

	if Input.is_action_just_pressed('ui_up') and jump_count < 2:  # Double Jump
		velocity.y = jump_speed
		jump_count += 1

	# Dashing Logic 
	if Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_left"):
		if dash_cooldown_timer <= 0 and !is_dashing:  # Can dash if cooldown is over and not already dashing
			dash_timer = dash_duration  # Start dash timer
			dash_cooldown_timer = dash_cooldown  # Start cooldown
			is_dashing = true  # Set the dash flag

	# Crouching Logic
	if Input.is_action_pressed("ui_down"):
		is_crouching = true
		scale = crouch_scale  
	else:
		is_crouching = false
		scale = Vector2(1, 1)

	# Move the character
	move_and_slide()
