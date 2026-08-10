extends Node


const MAZE = preload("uid://boe2epq11k7b0")
const PLAYER = preload("uid://c34o31mci65q")

@onready var world: Node2D = $World
var maze: Maze = MAZE.instantiate()
var player: CharacterBody2D = PLAYER.instantiate()

var correct_sequence: Array[String] = [
	"top",
	"top",
	"right",
	"bottom",
	"left"
]

var current_sequence: Array[String]

func _ready() -> void:
	world.add_child(maze)
	
	world.add_child(player)
	
	player.global_position = maze.get_spawn()
	SoundManager.play_background("VHS")
	
	maze.area_entered.connect(_on_area_entered)


func _on_area_entered(area_direction: String, new_position: Vector2) -> void:
	player.position = new_position
	current_sequence.append(area_direction)
	if current_sequence.back() != correct_sequence.get(current_sequence.size() - 1):
		current_sequence.clear()
	elif current_sequence.size() == correct_sequence.size():
		player.queue_free()
		await get_tree().create_timer(1).timeout
		JavaScriptBridge.eval("window.location.href = 'https://lyhottag13.github.io/shop-'")
