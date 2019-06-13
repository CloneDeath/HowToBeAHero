extends Button
signal action_pressed(input, input_count, output, output_count);

export(Array, String) var Requires = [];
export(Array, int) var RequiredAmount = [];

export(Array, String) var Produces = [];
export(Array, int) var ProducedAmount = [];

func _pressed():
	emit_signal("action_pressed", Requires, RequiredAmount, Produces, ProducedAmount);