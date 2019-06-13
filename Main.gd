extends Control

func _on_action_pressed(input, input_count, output, output_count):
	if (has_resources(input, input_count)):
		take_resources(input, input_count);
		give_resources(output, output_count);

func has_resources(input, input_count):
	return $VBoxContainer/Resources.has_resources(input, input_count);

func give_resources(output, output_count):
	$VBoxContainer/Resources.give_resources(output, output_count);

func take_resources(output, output_count):
	$VBoxContainer/Resources.take_resources(output, output_count);

func _process(_delta):
	$VBoxContainer/Actions.check_resources($VBoxContainer/Resources);