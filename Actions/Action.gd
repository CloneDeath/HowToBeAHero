extends Button
tool

export(Array, String) var Requires = [];
export(Array, float) var RequiredAmount = [];

export(Array, String) var Produces = [];
export(Array, float) var ProducedAmount = [];

func _ready():
	if (!Engine.editor_hint):
		self.visible = false;

func _pressed():
	if ($Resources.has_resources(Requires, RequiredAmount)):
		$Resources.take_resources(Requires, RequiredAmount);
		$Resources.give_resources(Produces, ProducedAmount);
	self.icon = null;

func _process(_delta):
	self.text = name;
	if (Engine.editor_hint): return;
	_check_resources();

func _check_resources():
	var has_resources = $Resources.has_resources(Requires, RequiredAmount);
	self.disabled = !has_resources;
	if ($Resources.resources_are_visible(Requires)):
		self.visible = true;