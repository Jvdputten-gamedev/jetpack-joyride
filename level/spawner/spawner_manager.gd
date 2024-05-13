extends Node

@onready var timer: Timer = $Timer
@export var coin_scene: PackedScene

var spawn_range: int = 450
var spawn_amplitude: int = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	timer.timeout.connect(_on_timer_timeout)
	spawn_coins()

func _on_timer_timeout():
	spawn_coins()

func spawn_coins(num_coins=25):
	var spawn_y = (randi() % spawn_range) - 0.5*spawn_range
	var spawn_sine_frequency: float = (2 * PI) / num_coins
	
	for i in range(num_coins):
		await get_tree().create_timer(0.1).timeout
		var coin = coin_scene.instantiate()
		add_child(coin)
		coin.position.y = spawn_y - spawn_amplitude * sin(i * spawn_sine_frequency)




