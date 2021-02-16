import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase/auth/auth.dart';
import 'package:flutterfirebase/helper/state.dart';
import 'package:flutterfirebase/pages/home/home.dart';

import 'assets/app_color.dart';

void main() async { 
	WidgetsFlutterBinding.ensureInitialized();
  	await Firebase.initializeApp();
	runApp(MainApp());
}

class MainApp extends StatefulWidget {
	
	@override
	_MainApp createState() => _MainApp();
}

class _MainApp extends State<MainApp> {

	bool _isLoginPage = false;

	void setIsLoginPage(bool isLoginPage) {
		StateHelper.setStateIfMounted(this, (){
			_isLoginPage = isLoginPage;
		});
	}

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flutter Firestore',
			theme: ThemeData(
				primarySwatch: Colors.blue,
				primaryColor: AppColor.redPrimary,
				visualDensity: VisualDensity.adaptivePlatformDensity,
			),
			home: HomePage(),
			// home: auth.current() != null ? HomePage(refreshPage: refreshAuth,) : (_isLoginPage ? LoginPage(setIsLoginPage: setIsLoginPage,) : RegisterPage(setIsLoginPage: setIsLoginPage,)),
		);
	}
}
