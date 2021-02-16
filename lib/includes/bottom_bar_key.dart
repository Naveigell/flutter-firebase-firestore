import 'package:flutter/material.dart';

GlobalKey _globalKey;

GlobalKey getGlobalKey(){
	if (_globalKey == null) {
		_globalKey = GlobalKey(debugLabel: "bottom_bar");
	}

	return _globalKey;
}