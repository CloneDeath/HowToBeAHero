extends Button
tool

signal action_pressed(input, input_count, output, output_count);

export(Array, String) var Requires = [];
export(Array, int) var RequiredAmount = [];

export(Array, String) var Produces = [];
export(Array, int) var ProducedAmount = [];

func _ready():
	if (!Engine.editor_hint):
		self.visible = false;

func _pressed():
	emit_signal("action_pressed", Requires, RequiredAmount, Produces, ProducedAmount);

func _process(_delta):
	self.text = name;

func check_resources(resources):
	var has_resources = resources.has_resources(Requires, RequiredAmount);
	self.disabled = !has_resources;
	if (has_resources):
		self.visible = true;
