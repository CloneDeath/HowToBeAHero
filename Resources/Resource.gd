extends VBoxContainer

var count = 0;

func _process(_delta):
	$Count.text = str(count);