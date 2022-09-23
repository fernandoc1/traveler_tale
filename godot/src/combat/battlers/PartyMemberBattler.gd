# Base entity that represents a PartyMember in combat
# Every battler has an AI node so all characters can work as a monster
# or as a computer-controlled player ally
extends Battler

class_name PartyMemberBattler

onready var battlerAnim: BattlerAnim = load("res://src/combat/animation/PartyMemberAnim.tscn").instance()

func _ready():
	battlerAnim.anim = AnimationPlayer.new()

func isPartyMember():
	return true

func getBattlerAnim():
	 return battlerAnim

func get_ai():
	return PlayerInput.new()
