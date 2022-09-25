extends Position2D

class_name BattlerAnim

onready var anim = $AnimationPlayer
onready var pawnAnim = $PawnAnimationPlayer
onready var extents: RectExtents = $RectExtents

func _init():
	print("Initializing")

func _ready():
	if(pawnAnim != null):
		pawnAnim.set_current_animation('walk')

func set_sprite_texture(path: String):
	$Root/Body.texture = load(path)

func play_stagger():
	anim.play("take_damage")
	yield(anim, "animation_finished")


func play_death():
	anim.play("death")
	yield(anim, "animation_finished")


func play_walk():
	pawnAnim.play("walk")
	yield(anim, "animation_finished")


func play_bump():
	pawnAnim.play("bump")
	yield(anim, "animation_finished")


func get_current_animation_length():
	return pawnAnim.current_animation_length
