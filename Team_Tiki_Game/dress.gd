extends Area2D

signal dress_picked_up

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		emit_signal("dress_picked_up")
		queue_free()
