extends CharacterBody2D

signal laser(pos, direction)
signal grenade(pos, direction)

var can_laser: bool = true
var can_granade: bool = true

func _process(_delta):
	# input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()

	# rotate
	look_at(get_global_mouse_position())

	# laser shooting input
	var player_direction = (get_global_mouse_position() - position).normalized()
	if Input.is_action_just_pressed("primary action") and can_laser:
		$GPUParticles2D.emitting = true
		var laser_markers = $LaserStartPos.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		$LaserReloadTimer.start()
		# emit the position we selected
		laser.emit(selected_laser.global_position, player_direction)

	# grenade shooting input
	if Input.is_action_just_pressed("secondary action") and can_granade:
		can_granade = false
		$GrenadeReloadTimer.start()
		var pos = $LaserStartPos.get_children()[0].global_position
		grenade.emit(pos, player_direction)

func _on_timer_timeout():
	can_laser = true


func _on_grenade_reload_timer_timeout():
	can_granade = true
