extends Control

func has_resource(resource, amount):
	for child in get_children():
		if (child.has_resource(resource, amount)):
			return true;
	return false;

func resource_is_visible(resource):
	for child in get_children():
		if (child.resource_is_visible(resource)):
			return true;
	return false;

func take_resource(resource, amount):
	for child in get_children():
		child.take_resource(resource, amount);

func give_resource(resource, amount):
	for child in get_children():
		child.give_resource(resource, amount);