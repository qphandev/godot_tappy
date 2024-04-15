extends Node2D

@export var pipes_scene: PackedScene # this is a type scene, you can reference other scenes with this

@onready var pipes_holder = $PipesHolder
@onready var spawn_u = $SpawnU
@onready var spawn_l = $SpawnL
@onready var spawn_timer = $SpawnTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_pipes()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func spawn_pipes() -> void: # strange how changing scroll speed from 50 to 120 separates the pipe, oh that's because it's based on dropping it via timing
	var y_pos = randf_range(spawn_u.position.y, spawn_l.position.y)
	var new_pipes = pipes_scene.instantiate()
	new_pipes.position = Vector2(spawn_l.position.x, y_pos)
	pipes_holder.add_child(new_pipes)
	
func _on_spawn_timer_timeout():
	spawn_pipes()
