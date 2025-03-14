extends Area2D

@export var required_key: String  # Name of the key required to open the door

# Called when the player interacts with the door
func _ready():
	body_entered.connect(_on_player_entered)

# Triggered when the player enters the door area
func _on_player_entered(body):
	if body.name == "Adventurer" and body.hasKey:  # Check if the player has the key
		print("Door unlocked!")
		get_tree().change_scene_to_file(str("res://scenes/WinScreen.tscn"))
	else:
		print("The door is locked. You need the key!")
