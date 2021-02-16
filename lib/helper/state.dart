import 'package:flutter/material.dart';

class StateHelper {
	static void setStateIfMounted(State state, f) {
		if (state.mounted) {
			state.setState(f);
		}
	}
}