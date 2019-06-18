extends Node
class_name ResourceInteractor

func _get_resources():
	return get_tree().get_nodes_in_group("resource");

# Groups
func has_resources(input, input_count):
	for i in range(input.size()):
		var resource = input[i];
		var amount = input_count[i];
		if (!has_resource(resource, amount)):
			return false;
	return true;

func give_resources(output, output_count):
	for i in range(output.size()):
		var resource = output[i];
		var amount = output_count[i];
		give_resource(resource, amount);

func take_resources(input, input_count):
	for i in range(input.size()):
		var resource = input[i];
		var amount = input_count[i];
		take_resource(resource, amount);

func reveal_resources(output):
	for i in range(output.size()):
		var resource = output[i];
		reveal_resource(resource);

func resources_have_been_crafted(input):
	for i in range(input.size()):
		var resource = input[i];
		if (!resource_has_been_crafted(resource)):
			return false;
	return true;

# Individual
func has_resource(resource, amount):
	for child in _get_resources():
		if (child.has_resource(resource, amount)):
			return true;
	return false;

func resource_has_been_crafted(resource):
	for child in _get_resources():
		if (child.resource_has_been_crafted(resource)):
			return true;
	return false;

func take_resource(resource, amount):
	for child in _get_resources():
		child.take_resource(resource, amount);

func give_resource(resource, amount):
	for child in _get_resources():
		child.give_resource(resource, amount);

func reveal_resource(resource):
	for child in _get_resources():
		child.reveal(resource);

func clear_requirements():
	for child in _get_resources():
		child.clear_requirements();

func add_requirement(resource, amount):
	for child in _get_resources():
		child.add_requirement(resource, amount);
		
func clear_products():
	for child in _get_resources():
		child.clear_products();
		
func add_product(resource, amount):
	for child in _get_resources():
		child.add_product(resource, amount);