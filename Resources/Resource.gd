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