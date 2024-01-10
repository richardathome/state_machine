@icon("res://addons/state_machine/state_machine_icon.png")
extends EditorPlugin
class_name StateMachine

@export var initial_state: State

@onready var actor: Node = get_parent()

var current_state: State

func _ready() -> void:

	for child:State in get_children():
		child.init(actor)

	await actor.ready

	change_state(initial_state)

func change_state(new_state: State) -> void:
	if new_state == current_state:
		return

	if current_state:
		current_state.exit()

	current_state = new_state
	current_state.enter()

func _physics_process(delta: float) -> void:
	if current_state and actor.is_in_tree():
		current_state.tick(delta)
