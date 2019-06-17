extends Button
tool

signal action_pressed(input, input_count, output, output_count);
signal action_focused(action);
signal action_focus_lost(action);

export(Array, String) var Requires = [];
export(Array, float) var RequiredAmount = [];

export(Array, String) var Produces = [];
export(Array, float) var ProducedAmount = [];

func _ready():
	if (!Engine.editor_hint):
		self.visible = false;
	self.hint_tooltip = get_details();
	self.connect("mouse_entered", self, "_mouse_entered");
	self.connect("mouse_exited", self, "_mouse_exited");

func get_details():
	return str("Requires: ", get_requirements(),
			   "\nProduces: ", get_products());

func get_requirements():
	if (Requires.size() == 0): return "Nothing";
	var req = "";
	for i in range(Requires.size()):
		var resource = Requires[i];
		var amount = RequiredAmount[i];
		req += str(resource, " x", amount);
		if (i != Requires.size() - 1):
			req += ", ";
	return req;

func get_products():
	if (Produces.size() == 0): return "Nothing";
	var req = "";
	for i in range(Produces.size()):
		var resource = Produces[i];
		var amount = ProducedAmount[i];
		req += str(resource, " x", amount);
		if (i != Produces.size() - 1):
			req += ", ";
	return req;

func _pressed():
	emit_signal("action_pressed", Requires, RequiredAmount, Produces, ProducedAmount);
	self.icon = null;

func _process(_delta):
	self.text = name;

func check_resources(resources):
	var has_resources = resources.has_resources(Requires, RequiredAmount);
	self.disabled = !has_resources;
	if (resources.resources_are_visible(Requires)):
		self.visible = true;

func _mouse_entered():
	emit_signal("action_focused", self);

func _mouse_exited():
	emit_signal("action_focus_lost", self);