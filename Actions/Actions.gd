extends Control
signal action_pressed(input, input_count, output, output_count);

func _ready():
	for child in get_children():
		child.connect("action_pressed", self, "_action_pressed");

func _action_pressed(input, input_count, output, output_count):
	emit_signal("action_pressed", input, input_count, output, output_count);

func check_resources(resources):
	for child in get_children():
		child.check_resources(resources);