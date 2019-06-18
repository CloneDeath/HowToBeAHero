extends Control

var _current_action = null;

func _ready():
	var actions = get_tree().get_nodes_in_group("action");
	for action in actions:
		action.connect("mouse_entered", self, "_on_action_focused", [action]);
		action.connect("mouse_exited", self, "_on_action_focus_lost", [action]);

func _on_action_focused(action):
	_current_action = action;
	$Resources.clear_requirements();
	for i in range(action.Requires.size()):
		var resource = action.Requires[i];
		var amount = action.RequiredAmount[i];
		$Resources.add_requirement(resource, amount);
	
	$Resources.clear_products();
	for i in range(action.Produces.size()):
		var resource = action.Produces[i];
		var amount = action.ProducedAmount[i];
		$Resources.add_product(resource, amount);

func _on_action_focus_lost(action):
	if (_current_action == action):
		$Resources.clear_requirements();
		$Resources.clear_products();
