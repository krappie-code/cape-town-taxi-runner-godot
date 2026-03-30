extends Node2D

# Cape Town Taxi Runner - Main Game Script
# Authentic South African minibus taxi endless runner

@onready var player = $Player
@onready var obstacles_node = $Obstacles
@onready var passengers_node = $Passengers
@onready var score_label = $UI/Score
@onready var destination_label = $UI/Destination
@onready var game_timer = $GameTimer

var score = 0
var game_speed = 100.0
var lane_positions = [380, 512, 644]  # Three lanes
var current_lane = 1
var is_jumping = false
var jump_speed = -400.0
var gravity = 980.0

# Cape Town destinations (authentic taxi routes)
var destinations = [
	"Bellville", "Wynberg", "Khayelitsha", "Mitchell's Plain",
	"Parow", "Goodwood", "Langa", "Gugulethu", 
	"Cape Town CBD", "Sea Point", "Observatory", "Rondebosch"
]
var current_destination = 0

# Obstacle types
var obstacle_types = ["pothole", "roadwork", "traffic", "speed_bump"]

func _ready():
	print("🚐 Cape Town Taxi Runner starting!")
	player.position.x = lane_positions[current_lane]
	update_destination()

func _process(delta):
	handle_input()
	update_player_physics(delta)
	move_obstacles(delta)
	move_passengers(delta)
	check_collisions()
	update_ui()

func handle_input():
	if Input.is_action_just_pressed("move_left") and current_lane > 0:
		current_lane -= 1
		move_to_lane()
	elif Input.is_action_just_pressed("move_right") and current_lane < 2:
		current_lane += 1
		move_to_lane()
	elif Input.is_action_just_pressed("jump") and not is_jumping:
		jump()

func move_to_lane():
	# Smooth lane transition
	var tween = create_tween()
	tween.tween_property(player, "position:x", lane_positions[current_lane], 0.2)
	print("🚖 Switching to lane ", current_lane + 1)

func jump():
	is_jumping = true
	player.velocity.y = jump_speed
	print("🦘 Taxi jump!")

func update_player_physics(delta):
	if is_jumping:
		player.velocity.y += gravity * delta
		player.position.y += player.velocity.y * delta
		
		# Land back on the road
		if player.position.y >= 450:
			player.position.y = 450
			is_jumping = false
			player.velocity.y = 0

func move_obstacles(delta):
	for obstacle in obstacles_node.get_children():
		obstacle.position.y += game_speed * delta
		if obstacle.position.y > 650:
			obstacle.queue_free()

func move_passengers(delta):
	for passenger in passengers_node.get_children():
		passenger.position.y += game_speed * delta
		if passenger.position.y > 650:
			passenger.queue_free()

func check_collisions():
	var jump_offset = 0
	if is_jumping and player.position.y < 450:
		jump_offset = 20
		
	var player_rect = Rect2(
		player.position.x - 30, 
		player.position.y - 15 - jump_offset,
		60, 30
	)
	
	# Check obstacle collisions
	for obstacle in obstacles_node.get_children():
		var obstacle_rect = Rect2(obstacle.position.x - 20, obstacle.position.y - 10, 40, 20)
		if player_rect.intersects(obstacle_rect):
			if not is_jumping or player.position.y > 430:
				game_over()
				return
	
	# Check passenger collection
	for passenger in passengers_node.get_children():
		var passenger_rect = Rect2(passenger.position.x - 15, passenger.position.y - 15, 30, 30)
		if player_rect.intersects(passenger_rect):
			collect_passenger(passenger)

func collect_passenger(passenger):
	score += 100
	passenger.queue_free()
	print("👥 Passenger collected! Score: ", score)
	
	# Play sound effect (would be actual audio in full version)
	print("🔊 *Taxi honk sound*")

func game_over():
	print("💥 TAXI CRASHED! Final score: ", score)
	get_tree().paused = true
	
	# In a full game, show game over screen
	print("🚐 Thanks for riding with Cape Town Taxis!")

func update_ui():
	score_label.text = "Score: " + str(score)
	destination_label.text = "Next Stop: " + destinations[current_destination]

func update_destination():
	current_destination = randi() % destinations.size()
	print("🎯 New destination: ", destinations[current_destination])

func _on_game_timer_timeout():
	spawn_obstacle()
	if randf() < 0.6:  # 60% chance
		spawn_passenger()
	
	# Increase difficulty over time
	game_speed += 2.0
	print("🏃 Speed increased to: ", game_speed)

func spawn_obstacle():
	var obstacle = ColorRect.new()
	var lane = randi() % 3
	var obstacle_type = obstacle_types[randi() % obstacle_types.size()]
	
	obstacle.position = Vector2(lane_positions[lane], -50)
	obstacle.size = Vector2(40, 20)
	
	# Set color based on obstacle type
	match obstacle_type:
		"pothole":
			obstacle.color = Color(0.4, 0.2, 0.0)  # Brown
			print("🕳️ Pothole spawned in lane ", lane + 1)
		"roadwork":
			obstacle.color = Color(1.0, 0.5, 0.0)  # Orange
			print("🚧 Roadwork spawned in lane ", lane + 1)
		"traffic":
			obstacle.color = Color(0.8, 0.0, 0.0)  # Red car
			print("🚗 Traffic spawned in lane ", lane + 1)
		"speed_bump":
			obstacle.color = Color(0.6, 0.6, 0.6)  # Gray
			print("⚠️ Speed bump spawned in lane ", lane + 1)
	
	obstacles_node.add_child(obstacle)

func spawn_passenger():
	var passenger = ColorRect.new()
	var lane = randi() % 3
	
	passenger.position = Vector2(lane_positions[lane], -30)
	passenger.size = Vector2(30, 30)
	passenger.color = Color(0.0, 0.5, 1.0)  # Blue
	
	passengers_node.add_child(passenger)
	print("🧍 Passenger waiting in lane ", lane + 1)