extends Node2D

@onready
var tile : TileMap= $TileMap
@onready
var timer = $Timer
@onready
var checkbutton = $HFlowContainer/CheckButton
@onready
var label_status = $HFlowContainer/Label

var lv = LiveLogic.new()

var atlas_pos = Vector2i(0,0)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				
				var mouse_pos = get_global_mouse_position()
				var tile_map_position = tile.local_to_map(mouse_pos)
				
				
				if tile.get_cell_source_id(0, tile_map_position) == 0:
					tile.set_cell(0,tile_map_position,-1)
					lv.remove_cell(tile_map_position)
				else:
					tile.set_cell(0,tile_map_position,0, atlas_pos)
					
					lv.add_cell(tile_map_position)
				
			else:
				print("Left button was released")
#		if event.button_index == BUTTON_WHEEL_DOWN:
#			print("Wheel down")



#TImer timeout, update state
func _on_timer_timeout():
	tile.clear()
	lv.next_state()
	
	for c in lv.enviroment:
		tile.set_cell(0,c,0, atlas_pos)
	label_status.text = "Generation: " + str(lv.generation) + " Alive: " + str(lv.population)




#Start Pause
func _on_check_button_pressed():
	
	if checkbutton.button_pressed:
		timer.start()
	else:
		timer.stop()


#Clear game state
func _on_button_pressed():
	timer.stop()
	lv.enviroment.clear()
	tile.clear()
	lv.generation = 0
	lv.population = 0
	label_status.text = "Generation: " + str(0) + " Alive: " + str(0)

