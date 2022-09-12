extends Position2D

class_name PawnAnim

onready var anim = $AnimationPlayer


func _ready():
	anim.set_current_animation('walk')

func set_sprite_texture(path: String):
	$Root/Body.texture = load(path)

func play_walk():
	anim.play("walk")
	yield(anim, "animation_finished")


func play_bump():
	anim.play("bump")
	yield(anim, "animation_finished")


func get_current_animation_length():
	return anim.current_animation_length
