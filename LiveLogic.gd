extends Object

class_name LiveLogic

var enviroment = {}
var population = 0
var generation = 0


func add_cell(vect):
	#var key = str(x) + "," + str(y)
	enviroment[vect] = 1
	
func remove_cell(vect):
	#var key = str(x) + "," + str(y)
	enviroment.erase(vect)

func next_state():
	
	var next_state_enviroment = {}
	
	for c in enviroment:
		var n = _find_number_of_neighbors(c)
		if n == 2 or n == 3:
			next_state_enviroment[c] = 1

		var v = Vector2i(c.x - 1, c.y - 1)
		if !enviroment.has(v):
			n = _find_number_of_neighbors(v)
			if n == 3:
				next_state_enviroment[v] = 1
				
		v = Vector2i(c.x, c.y - 1)
		if !enviroment.has(v):
			n = _find_number_of_neighbors(v)
			if n == 3:
				next_state_enviroment[v] = 1

		v = Vector2i(c.x + 1, c.y - 1)
		if !enviroment.has(v):
			n = _find_number_of_neighbors(v)
			if n == 3:
				next_state_enviroment[v] = 1
			
		v = Vector2i(c.x - 1, c.y)
		if !enviroment.has(Vector2i(c.x - 1, c.y)):
			n = _find_number_of_neighbors(v)
			if n == 3:
				next_state_enviroment[v] = 1

		v = Vector2i(c.x + 1, c.y)
		if !enviroment.has(v):
			n = _find_number_of_neighbors(v)
			if n == 3:
				next_state_enviroment[v] = 1

		v = Vector2i(c.x - 1, c.y + 1)
		if !enviroment.has(v):
			n = _find_number_of_neighbors(v)
			if n == 3:
				next_state_enviroment[v] = 1

		v = Vector2i(c.x, c.y + 1)
		if !enviroment.has(v):
			n = _find_number_of_neighbors(v)
			if n == 3:
				next_state_enviroment[v] = 1

		v = Vector2i(c.x + 1, c.y + 1)
		if !enviroment.has(v):
			n = _find_number_of_neighbors(v)
			if n == 3:
				next_state_enviroment[v] = 1
	
	enviroment = next_state_enviroment
	generation = generation + 1
	population = enviroment.size()


func _find_number_of_neighbors(vec):
	var number = 0
	
	if enviroment.has(Vector2i(vec.x - 1, vec.y - 1)):
		number = number + 1
	if enviroment.has(Vector2i(vec.x, vec.y - 1)):
		number = number + 1
	if enviroment.has(Vector2i(vec.x + 1, vec.y - 1)):
		number = number + 1
	if enviroment.has(Vector2i(vec.x - 1, vec.y)):
		number = number + 1
	if enviroment.has(Vector2i(vec.x + 1, vec.y)):
		number = number + 1
	if enviroment.has(Vector2i(vec.x - 1, vec.y + 1)):
		number = number + 1
	if enviroment.has(Vector2i(vec.x, vec.y + 1)):
		number = number + 1
	if enviroment.has(Vector2i(vec.x + 1, vec.y + 1)):
		number = number + 1
	
	return number



func print_cells():
	for c in enviroment:
		print(enviroment[c])
	print("************************************")
	print(enviroment.has(Vector2(0,0)))
	print("************************************")
