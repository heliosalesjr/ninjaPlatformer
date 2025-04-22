extends CharacterBody2D
@onready var anchor: Node2D = $Anchor

@onready var animation_player_lower: AnimationPlayer = $AnimationPlayerLower
@onready var animation_player_upper: AnimationPlayer = $AnimationPlayerUpper


func _physics_process(delta: float) -> void:
	
	var x_input = Input.get_axis("ui_left", "ui_right")
	
	if not is_on_floor():
		velocity.y += 500 * delta
	
	if Input.is_action_just_pressed("ui_up"):
		velocity.y -= 200
	
	velocity.x = x_input * 80	
	
	if x_input == 0:
		animation_player_lower.play("stand")
		animation_player_upper.play("stand")	
	else:
		anchor.scale.x = sign(x_input)
		animation_player_lower.play("run")
		animation_player_upper.play("run")
		
		
	move_and_slide()
	
