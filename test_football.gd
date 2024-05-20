extends Node3D

var kick_strength = 12
var ball_pos

func _ready():
	ball_pos = $Ball.global_transform.origin

func _process(delta):
	var change_strength = Input.get_axis("ui_down", "ui_up");
	kick_strength = clamp(kick_strength + change_strength * 50 * delta, 2, 150)
	$StrengthLabel.text = str(round(kick_strength))

func _input(event):
	if event.is_action_pressed("ui_kick"):
		$Leg/Foot.apply_central_impulse(Vector3(0, 0, -kick_strength))
	elif event.is_action_pressed("ui_reset"):
		reset_ball()
		
func reset_ball():
	$Ball.global_transform.origin = ball_pos  # Reset position
	$Ball.linear_velocity = Vector3.ZERO	
	$Ball.angular_velocity = Vector3.ZERO
	$Leg/Foot.linear_velocity = Vector3.ZERO
	$Leg/Foot.angular_velocity = Vector3.ZERO
