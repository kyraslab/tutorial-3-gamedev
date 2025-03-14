extends Area2D

@onready var sound_player: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var sprite: Sprite2D = $Sprite2D

func _ready():
	body_entered.connect(_on_player_entered)

func _on_player_entered(body):
	if body.name == "Adventurer":
		sound_player.play()
		body.hasKey = true
		sprite.visible = false
		print("You have collected the key!")
