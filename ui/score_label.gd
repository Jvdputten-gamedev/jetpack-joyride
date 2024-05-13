extends Label


var score: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	EventBus.coin_collected.connect(_on_coin_collected)
	text = "Score: 0" 

func _on_coin_collected():
	score += 1
	text = "Score: " + str(score)