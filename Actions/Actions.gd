extends Control
signal action_pressed(input, input_count, output, output_count);
signal action_focused(action);
signal action_focus_lost(action);

func _ready():
	for child in get_children():
		child.connect("action_pressed", self, "_action_pressed");
		child.connect("action_focused", self, "_action_focused");
		child.connect("action_focus_lost", self, "_action_focus_lost");

func _action_pressed(input, input_count, output, output_count):
	emit_signal("action_pressed", input, input_count, output, output_count);

func _action_focused(action):
	emit_signal("action_focused", action);

func _action_focus_lost(action):
	emit_signal("action_focus_lost", action);

func check_resources(resources):
	for child in get_children():
		child.check_resources(resources);