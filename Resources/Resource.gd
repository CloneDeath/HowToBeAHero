extends VBoxContainer
tool

export(Texture) var ResourceTexture = null;

var count = 0;
var required = 0;

func _ready():
	if (!Engine.editor_hint):
		self.visible = false;

func _process(_delta):
	$Name.text = self.name;
	
	if (required > 0):
		$Count.text = str(count, "/", required);
		var highlight := Color.green;
		if (!_has_enough(required)):
			highlight = Color.red;
		$Count.add_color_override("font_color", highlight);
	else:
		$Count.text = str(count);
		$Count.add_color_override("font_color", Color.white);
	$Image.texture = ResourceTexture;
	if (count > 0):
		self.visible = true;

func has_resource(resource, amount):
	return name == resource && _has_enough(amount);

func resource_is_visible(resource):
	return name == resource && self.visible;

func take_resource(resource, amount):
	if (name != resource): return;
	count -= amount;

func give_resource(resource, amount):
	if (name != resource): return;
	count += amount;

func clear_requirements():
	required = 0;

func add_requirement(resource, amount):
	if (name != resource): return;
	required = amount;

func _has_enough(needed):
	return (count + 0.0001) >= needed;