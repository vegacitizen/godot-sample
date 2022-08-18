extends Spatial

var dragging = false
var click_radius = 32 # Size of the sprite.

var root
var camera

# Called when the node enters the scene tree for the first time.
func _ready():
	root = get_node("../../Spatial")
	camera = get_node("../Camera")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	print(event.to_string());
	print(event.is_pressed())

	if event is InputEventMouseButton :
		print("InputEventMouseButton : ");
		#var sphere = CSGSphere.new()
		#sphere.radius = 0.02
		#sphere.translate(cursorPos.position)
		#root.add_child(sphere)
		
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		#if (event.position - $Sprite.position).length() < click_radius:
			# Start dragging if the click is on the sprite.
		if not dragging and event.pressed:
			dragging = true
		# Stop dragging if the button is released.
		if dragging and not event.pressed:
			dragging = false

	if event is InputEventMouseMotion and dragging:
		# While dragging, move the sprite with the mouse.		
		var from = camera.project_ray_origin(event.position)
		var to = from + camera.project_ray_normal(event.position) * 10
		var space_state = get_world().direct_space_state
		var cursorPos = space_state.intersect_ray(from, to)
		var sphere = CSGSphere.new()
		sphere.radius = 0.02
		sphere.translate(cursorPos.position)
		root.add_child(sphere)
		
