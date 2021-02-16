import 'package:flutter/material.dart';
import 'package:flutterfirebase/auth/auth.dart';
import 'package:flutterfirebase/pages/login/login.dart';

AppBar baseAppBar(BuildContext context){
	return AppBar(
		title: InkWell(
			child: const Text(
				"Firestore"
			),
			onTap: (){
				Auth auth = Auth();
				auth.logout();

				Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
			},
		)
	);
}