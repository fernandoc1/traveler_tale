# Container for the player's party
# Holds all playable game characters whether the player
# has already unlocked them or not in the game.
# After an encounter, it delegates stats update (experience and health) to each
# active party member
extends Node2D
class_name Party

export var PARTY_SIZE: int = 3

var inventory = Inventory.new()

var PartyMember = preload("res://src/party/PartyMember.tscn")
var PawnAnim = preload("res://src/map/pawns/PawnAnim.tscn")
var PartyMemberAnim = preload("res://src/combat/animation/PartyMemberAnim.tscn")

func _ready():
	create_battler("res://assets/sprites/battlers/archer-f-p3.png")
	create_battler("res://assets/sprites/battlers/beatrix-p5.png")
	#create_battler("res://assets/sprites/battlers/barthello-p5.png")
	pass
	
func create_battler(spriteTexture: String):
	var partyMember = PartyMember.instance()
	var battler: Battler = partyMember.get_node("Battler")
	var partyMemberAnim = PartyMemberAnim.instance()
	var battlerSkin: Position2D = battler.get_node("Skin")

	battlerSkin.add_child(partyMemberAnim)
	battler.stats = CharacterStats.new()
	partyMember.initializeNow = false
	
	partyMemberAnim.set_sprite_texture(spriteTexture)
	
	self.add_child(partyMember)

	partyMember.growth = load("res://src/combat/battlers/jobs/SquireJob.tres")
	partyMember.initializeNow = true
	partyMember._ready()


func get_active_members():
	# Returns the first unlocked children until the party is filled
	var active = []
	var available = get_unlocked_characters()
	for i in range(min(len(available), PARTY_SIZE)):
		active.append(available[i])
	return active


func get_unlocked_characters() -> Array:
	# Returns all the characters that can be active in the party
	var has_unlocked = []
	for member in get_children():
		if member.visible:
			has_unlocked.append(member)
	return has_unlocked
