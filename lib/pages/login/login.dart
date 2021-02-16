import 'package:flutter/material.dart';
import 'package:flutterfirebase/assets/app_color.dart';
import 'package:flutterfirebase/auth/auth.dart';
import 'package:flutterfirebase/helper/text_field.dart';
import 'package:flutterfirebase/pages/home/home.dart';

typedef void SetBasePage(int base);

class LoginPage extends StatefulWidget {

	SetBasePage setBasePage;

	LoginPage({this.setBasePage});

	@override
	_Page createState(){
		return _Page();
	}
}

class _Page extends State<LoginPage> {

	bool isLoading = false;
	String errorMessage = "";
	TextEditingController 	editEmail = new TextEditingController(), 
							editPassword = new TextEditingController();
	
	FocusNode 	focusEmail = new FocusNode(), 
				focusPassword = new FocusNode();

	void fillDummyValue(){
		// editEmail.text = "test@gmail.com";
		// editPassword.text = "123456";
	}

	void _onSignUpHover(PointerEvent event) {

	}
	
	@override
	void initState() {
		super.initState();
		fillDummyValue();

		focusEmail.addListener(_removeErrorMessage);
		focusPassword.addListener(_removeErrorMessage);
	}

	void _removeErrorMessage(){
		setState(() {
			errorMessage = "";
		});
	}

	Widget cicular(){
		return SizedBox(
			child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),),
			height: 21,
			width: 21,
		);
	}

	Widget text(String text, Color color){
		return Text(
			text,
			style: TextStyle(
				fontSize: 17.0,
				fontFamily: 'MontserratBold',
				color: color
			),
		);
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			resizeToAvoidBottomInset: false,
			body: Container(
				padding: EdgeInsets.all(20.0),
				child: Center(
					child: Wrap(
						children: [
							Column(
								crossAxisAlignment: CrossAxisAlignment.stretch,
								mainAxisAlignment: MainAxisAlignment.center,
								children: [
									Align(
										alignment: Alignment.topCenter,
										child: Text(
											"Sign In",
											style: TextStyle(
												fontSize: 26.0,
												fontFamily: 'MontserratBold',
												fontWeight: FontWeight.bold
											),
											textAlign: TextAlign.center,
										),
									),
									SizedBox(height: 50),
									Container(
										child: Theme(
											data: Theme.of(context).copyWith(primaryColor: AppColor.greyPrimary), 
											child: TextFormField(
												focusNode: focusEmail,
												controller: editEmail,
												decoration: InputDecoration(
													prefixIcon: Icon(Icons.email, color: AppColor.greyPrimary),
													contentPadding: EdgeInsets.only(top: 2, bottom: 2, left: 25, right: 25),
													border: OutlineInputBorder(
														borderSide: BorderSide(
															color: Color.fromRGBO(242, 242, 242, 1),
															width: 1
														),
														borderRadius: BorderRadius.all(Radius.circular(7)),
													),
													enabledBorder: OutlineInputBorder(
														borderSide: BorderSide(
															color: AppColor.greyPrimary,
															width: 1
														),
														borderRadius: BorderRadius.all(Radius.circular(7))
													),
													focusedBorder: OutlineInputBorder(
														borderSide: BorderSide(
															color: AppColor.greyPrimary,
															width: 1
														),
														borderRadius: BorderRadius.all(Radius.circular(7))
													),
													hintText: "example@mail.com"
												),
												style: TextStyle(
													fontSize: 17
												),
											),
										)
									),
									SizedBox(height: 10),
									Container(
										child: Theme(
											data: Theme.of(context).copyWith(primaryColor: AppColor.greyPrimary), 
											child: TextField(
												focusNode: focusPassword,
												controller: editPassword,
												obscureText: true,
												decoration: InputDecoration(
													prefixIcon: Icon(Icons.vpn_key, color: AppColor.greyPrimary),
													contentPadding: EdgeInsets.only(top: 2, bottom: 2, left: 25, right: 25),
													border: OutlineInputBorder(
														borderSide: BorderSide(
															color: Color.fromRGBO(242, 242, 242, 1),
															width: 1
														),
														borderRadius: BorderRadius.all(Radius.circular(7)),
													),
													enabledBorder: OutlineInputBorder(
														borderSide: BorderSide(
															color: AppColor.greyPrimary,
															width: 1
														),
														borderRadius: BorderRadius.all(Radius.circular(7))
													),
													focusedBorder: OutlineInputBorder(
														borderSide: BorderSide(
															color: AppColor.greyPrimary,
															width: 1
														),
														borderRadius: BorderRadius.all(Radius.circular(7))
													),
													hintText: "********"
												),
												style: TextStyle(
													fontSize: 17
												),
											),
										)
									),
									if (errorMessage.isNotEmpty)
										Container(
											margin: EdgeInsets.only(top: 10),
											child: Text(
												errorMessage,
												style: TextStyle(
													fontSize: 18.0,
													fontFamily: 'MontserratRegular',
													color: AppColor.redPrimary
												),
												textAlign: TextAlign.center,
											)
										)
									,
									Container(
										margin: EdgeInsets.only(top: 10),
										child: ElevatedButton(
											child: isLoading ? cicular() : text("Login", Colors.white),
											onPressed: () {
												setState(() {
													isLoading = true;
												});
												login();
											},
											style: ElevatedButton.styleFrom(
												primary: AppColor.redPrimary,
												padding: EdgeInsets.only(top: 20, bottom: 20),
												elevation: 0,
												shape: RoundedRectangleBorder(
													borderRadius: BorderRadius.all(Radius.circular(7))
												)
											),
											
											// style: ButtonStyle(
											// 	backgroundColor: MaterialStateProperty.all<Color>(
											// 		AppColor.redPrimary
											// 	),
											// ),
										),
									),
									SizedBox(height: 10),
									Align(
										alignment: Alignment.topCenter,
										child: Text(
											"or",
											style: TextStyle(
												fontSize: 18,
												fontFamily: 'MontserratRegular',
											),
											textAlign: TextAlign.center,
										),
									),
									Container(
										margin: EdgeInsets.only(top: 10),
										child: MouseRegion(
											child: ElevatedButton(
												child: text("Register", Colors.black87),
												onPressed: () {
													widget.setBasePage(2);
												},
												style: ElevatedButton.styleFrom(
													primary: Colors.white,
													padding: EdgeInsets.only(top: 20, bottom: 20),
													elevation: 0,
													shape: RoundedRectangleBorder(
														borderRadius: BorderRadius.all(Radius.circular(7)),
														side: BorderSide(color: AppColor.greyPrimary)
													),
													
												),
											),
											onHover: _onSignUpHover,
										),
									),
								],
							),
						],
					),
				),
			),
		);
	}

	void login() async {
		unfocus(context);
		try {
			await Auth().signInWithEmailAndPassword(editEmail.text, editPassword.text);

			Route route = MaterialPageRoute(builder: (context) => HomePage());

			Navigator.pushReplacement(context, route);
		} catch (e) {
			if (e.code == "user-not-found") {
				errorMessage = "User not found";
			} else if (e.code == "wrong-password") {
				errorMessage = "Password wrong";
				editPassword.clear();
			} else if (e.code == "invalid-email") {
				errorMessage = "Email format invalid";
			}
		}

		setState(() {
			isLoading = false;
		});
	}
}