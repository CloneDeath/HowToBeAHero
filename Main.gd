extends Control

var _current_action = null;

func _on_action_pressed(input, input_count, output, output_count):
	if (has_resources(input, input_count)):
		take_resources(input, input_count);
		give_resources(output, output_count);

func has_resources(input, input_count):
	var resources = $VBoxContainer/Resources;
	for i in range(input.size()):
		var resource = input[i];
		var amount = input_count[i];
		if (!resources.has_resource(resource, amount)):
			return false;
	return true;

func give_resources(output, output_count):
	var resources = $VBoxContainer/Resources;
	for i in range(output.size()):
		var resource = output[i];
		var amount = output_count[i];
		resources.give_resource(resource, amount);

func take_resources(input, input_count):
	var resources = $VBoxContainer/Resources;
	for i in range(input.size()):
		var resource = input[i];
		var amount = input_count[i];
		resources.take_resource(resource, amount);

func resources_are_visible(input):
	var resources = $VBoxContainer/Resources;
	for i in range(input.size()):
		var resource = input[i];
		if (!resources.resource_is_visible(resource)):
			return false;
	return true;

func _process(_delta):
	$VBoxContainer/Actions.check_resources(self);

func _on_action_focused(action):
	_current_action = action;
	$VBoxContainer/Resources.clear_requirements();
	for i in range(action.Requires.size()):
		var resource = action.Requires[i];
		var amount = action.RequiredAmount[i];
		$VBoxContainer/Resources.add_requirement(resource, amount);
	
	$VBoxContainer/Resources.clear_products();
	for i in range(action.Produces.size()):
		var resource = action.Produces[i];
		var amount = action.ProducedAmount[i];
		$VBoxContainer/Resources.add_product(resource, amount);

func _on_action_focus_lost(action):
	if (_current_action == action):
		$VBoxContainer/Resources.clear_requirements();
		$VBoxContainer/Resources.clear_products();
