extends VBoxContainer
tool

export(Texture) var ResourceTexture = null;

var count = 0;

func _ready():
	if (!Engine.editor_hint):
		self.visible = false;

func _process(_delta):
	$Name.text = self.name;
	$Count.text = str(count);
	$Image.texture = ResourceTexture;
	if (count > 0):
		self.visible = true;

func has_resource(resource, amount):
	return name == resource && count >= amount;

func resource_is_visible(resource):
	return name == resource && self.visible;

func take_resource(resource, amount):
	if (name != resource): return;
	count -= amount;

func give_resource(resource, amount):
	if (name != resource): return;
	count += amount;