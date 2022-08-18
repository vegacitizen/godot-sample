extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	print(event.to_string());
	print(event.is_pressed())

	if event is InputEventMouseButton :
		print("InputEventMouseButton : ");
		var camera = get_node("../Camera")
		var from = camera.project_ray_origin(event.position)
		var to = from + camera.project_ray_normal(event.position) * 10
		var space_state = get_world().direct_space_state
		var cursorPos = space_state.intersect_ray(from, to)
		print(cursorPos);
		
	if event is InputEventMouseMotion :
		print("InputEventMouseMotion : ")
		print(event.speed)
		
	if event is InputEventScreenDrag :
		print("InputEventScreenDrag : ")
		print(event.position)
		print(event.related)
		print(event.speed)
