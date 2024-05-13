extends Node2D


const MOVEMENT_SPEED: int = 400
@onready var area: Area2D = $Area2D
@onready var pickup_sound: AudioStreamPlayer = $PickupSound


func _ready():
	area.body_entered.connect(_on_body_entered)
	

func _process(delta):
	global_position.x -= MOVEMENT_SPEED * delta

func _on_body_entered(_body: Node2D):
	EventBus.coin_collected.emit()
	pickup_sound.play()
	visible = false

	await pickup_sound.finished
	queue_free()


