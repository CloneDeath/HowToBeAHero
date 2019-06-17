extends VBoxContainer
tool

export(Texture) var ResourceTexture = null;

var count = 0;
var required = 0;
var produces = 0;

func _ready():
	if (!Engine.editor_hint):
		self.visible = false;

func _process(_delta):
	if (count <= 0): count = 0;
	
	$Name.text = self.name;
	
	$Count.text = str(count);
	var highlight = Color.white;
	if (required > 0):
		$Count.text += str("/", required);
		if (_has_enough(required)):
			highlight = Color.green;
		else:
			highlight = Color.red;
	if (produces > 0):
		$Count.text += str(" (+", produces, ")");
	$Count.add_color_override("font_color", highlight);
	
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

func clear_products():
	produces = 0;

func add_product(resource, amount):
	if (name != resource): return;
	produces = amount;

func _has_enough(needed):
	return (count + 0.0001) >= needed;