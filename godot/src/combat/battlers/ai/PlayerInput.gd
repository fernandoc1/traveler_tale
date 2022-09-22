extends BattlerAI

var interface: Node

class_name PlayerInput

#func choose_action(actor: Battler, battlers: Array = []):
func choose_action(actor, battlers: Array = []):
	# Select an action to perform in combat
	# Can be based on state of the actor
	interface.open_actions_menu(actor)
	return yield(interface, "action_selected")

#func choose_target(actor: Battler, action: CombatAction, battlers: Array = []):
func choose_target(actor, action: CombatAction, battlers: Array = []):
	# Chooses a target to perform an action on
	interface.select_targets(battlers)
	return yield(interface, "targets_selected")
