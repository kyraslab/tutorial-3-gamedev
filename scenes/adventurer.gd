extends CharacterBody2D

@export var speed: float = 300.0
@onready var sprite := $AnimatedSprite2D

var hasKey: bool = false

func _process(delta: float) -> void:
	move_character(delta)

func move_character(delta: float) -> void:
	var direction = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1

	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()

	update_animation(direction)

func update_animation(direction: Vector2) -> void:
	if direction != Vector2.ZERO:
		if direction.x > 0:
			sprite.flip_h = false
			sprite.play("jalan")
		elif direction.x < 0:
			sprite.flip_h = true
			sprite.play("jalan")
	else:
		sprite.play("idle")

func has_key() -> bool:
	return hasKey
