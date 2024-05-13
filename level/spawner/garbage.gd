extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	area_entered.connect(_on_area_entered)


func _on_area_entered(area: Node2D):
	area.queue_free()
	print("removing object")
