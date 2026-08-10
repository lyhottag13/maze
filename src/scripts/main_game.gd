extends Node


const MAZE = preload("uid://boe2epq11k7b0")
const PLAYER = preload("uid://c34o31mci65q")

@onready var world: Node2D = $World
var maze: Maze = MAZE.instantiate()
var player: CharacterBody2D = PLAYER.instantiate()

func _ready() -> void:
	world.add_child(maze)
	
	world.add_child(player)
	
	player.global_position = maze.get_spawn()
	print_debug(maze.get_spawn())
	SoundManager.play_background("VHS")
	
	maze.area_entered.connect(_on_area_entered)


func _on_area_entered(area_direction: String) -> void:
	var new_location = maze.get_area(area_direction)
	maze.area_entered.disconnect(_on_area_entered)
	player.position = new_location
	_do_funky.call_deferred()


func _do_funky() -> void:
	maze.area_entered.connect(_on_area_entered)
