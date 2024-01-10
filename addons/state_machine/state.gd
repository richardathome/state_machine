@icon("res://addons/state_machine/state_icon.png")
extends Node
class_name State

var actor: Node

func init(_actor: Node) -> void:
	actor = _actor

func enter() -> void:
	pass

func exit() -> void:
	pass

func tick(_delta: float) -> void:
	pass
