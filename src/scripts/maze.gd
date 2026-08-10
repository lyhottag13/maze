class_name Maze
extends Node2D

signal area_entered(area_direction: String)

@onready var marker_2d: Marker2D = $Marker2D
@onready var top_area: Area2D = $Node2/TopArea
@onready var right_area: Area2D = $Node2/RightArea
@onready var bottom_area: Area2D = $Node2/BottomArea
@onready var left_area: Area2D = $Node2/LeftArea
@onready var top: Marker2D = $Node/Top
@onready var right: Marker2D = $Node/Right
@onready var bottom: Marker2D = $Node/Bottom
@onready var left: Marker2D = $Node/Left

func get_spawn() -> Vector2:
	return marker_2d.position


func _on_area_body_entered(_body: Node2D, area_direction: String) -> void:
	area_entered.emit(area_direction)


func get_area(area_direction: String) -> Vector2:
	match area_direction:
		"top":
			return bottom.position
		"right":
			return left.position
		"bottom":
			return top.position
		"left":
			return right.position
		_:
			return marker_2d.position
