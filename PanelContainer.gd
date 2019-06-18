extends PanelContainer
tool

func _process(_delta):
	$VBoxContainer/Label.text = self.name;
	if (Engine.editor_hint): return;
	self.visible = _any_child_resource_is_visible();

func _any_child_resource_is_visible():
	for child in _get_resources():
		if (child.has_been_revealed()):
			return true;
	return false;

func _get_resources():
	return $VBoxContainer/Resources.get_children();