extends HBoxContainer

func has_resources(input, input_count):
	for i in range(input.size()):
		var resource = input[i];
		var amount = input_count[i];
		var child = get_node(resource);
		if (child.count < amount): return false;
	return true;

func resources_are_visible(input):
	for resource in input:
		var child = get_node(resource);
		if (child.count < 1): return false;
	return true;

func take_resources(input, input_count):
	for i in range(input.size()):
		var resource = input[i];
		var amount = input_count[i];
		var child = get_node(resource);
		child.count -= amount;

func give_resources(output, output_count):
	for i in range(output.size()):
		var resource = output[i];
		var amount = output_count[i];
		var child = get_node(resource);
		child.count += amount;