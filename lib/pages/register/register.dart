import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase/assets/app_color.dart';
import 'package:flutterfirebase/auth/auth.dart';
import 'package:flutterfirebase/helper/text_field.dart';
import 'package:flutterfirebase/pages/home/home.dart';

typedef void SetBasePage(int base);

class RegisterPage extends StatefulWidget {

	SetBasePage setBasePage;

	RegisterPage({this.setBasePage});

	@override
	_Page createState(){
		return _Page();
	}
}

class _Page extends State<RegisterPage> {

	bool isLoading = false;
	String errorMessage = "";
	TextEditingController 	editEmail = new TextEditingController(), 
							editUsername = new TextEditingController(),
							editDisplayName = new TextEditingController(),
							editPassword = new TextEditingController(),
							editPasswordRepeat = new TextEditingController();
	
	FocusNode 	focusEmail = new FocusNode(), 
				focusUsername = new FocusNode(),
				focusDisplayName = new FocusNode(),
				focusPassword = new FocusNode(),
				focusPasswordRepeat = new FocusNode();

	void fillDummyValue(){
		// editEmail.text = "test@gmail.com";
		// editPassword.text = "123456";
		// editPasswordRepeat.text = "12345s6";
	}

	void _onSignUpHover(PointerEvent event) {

	}
	
	@override
	void initState() {
		super.initState();
		fillDummyValue();

		focusEmail.addListener(_removeErrorMessage);
		focusPassword.addListener(_removeErrorMessage);
		focusPasswordRepeat.addListener(_removeErrorMessage);
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
											"Sign Up",
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
											child: TextFormField(
												focusNode: focusUsername,
												controller: editUsername,
												decoration: InputDecoration(
													prefixIcon: Icon(Icons.person, color: AppColor.greyPrimary),
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
													hintText: "example123"
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
											child: TextFormField(
												focusNode: focusDisplayName,
												controller: editDisplayName,
												decoration: InputDecoration(
													prefixIcon: Icon(Icons.person_pin_rounded, color: AppColor.greyPrimary),
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
													hintText: "Example Doe"
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
									SizedBox(height: 10),
									Container(
										child: Theme(
											data: Theme.of(context).copyWith(primaryColor: AppColor.greyPrimary), 
											child: TextField(
												focusNode: focusPasswordRepeat,
												controller: editPasswordRepeat,
												obscureText: true,
												decoration: InputDecoration(
													prefixIcon: Icon(Icons.repeat_one_rounded, color: AppColor.greyPrimary),
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
											child: isLoading ? cicular() : text("Register", Colors.white),
											onPressed: () {
												setState(() {
													isLoading = true;
												});
												register();
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
												child: text("Login", Colors.black87),
												onPressed: () {
													widget.setBasePage(1);
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

	void register() async {
		try {

			if (editUsername.text.isEmpty) {
			  	FirebaseAuthException exception = FirebaseAuthException(code: 'username-empty', message: 'Username could not be empty');
				throw exception;
			} else if (editDisplayName.text.isEmpty) {
			  	FirebaseAuthException exception = FirebaseAuthException(code: 'display-name-empty', message: 'Display Name could not be empty');
				throw exception;
			} else if (editPassword.text.isEmpty || editPasswordRepeat.text.isEmpty) {
				FirebaseAuthException exception = FirebaseAuthException(code: 'password-empty', message: 'Password or password repeat could not be empty');
				throw exception;
			} else if (editPassword.text.length < 6 || editPasswordRepeat.text.length < 6) {
				FirebaseAuthException exception = FirebaseAuthException(code: 'password-length', message: 'Password or password repeat length could not less than 6');
				throw exception;
			} else if (editPassword.text != editPasswordRepeat.text) {
			  	FirebaseAuthException exception = FirebaseAuthException(code: 'password-does-not-same', message: 'The password repeat must be same');
				throw exception;
			}
			unfocus(context);

			await FirebaseFirestore.instance.collection("users").where("username", isEqualTo: editUsername.text).get().then((value) async {
				if (value.docs.isEmpty) {
					await Auth().createUserWithEmailAndPassword(editEmail.text, editPassword.text).onError((error, stackTrace) {
						if (error.code == "invalid-email") {
							errorMessage = "The email address is badly formatted";
						} else if (error.code == "email-already-in-use") {
							errorMessage = "Email already in use";
						}
					}).then((value) {
						if (value != null) {
							FirebaseFirestore.instance.collection("users").doc(value.user.uid).set({
								"email": editEmail.text,
								"display_name": editDisplayName.text,
								"username": editUsername.text
							}).then((value) {
								Route route = MaterialPageRoute(builder: (context) => HomePage());

								Navigator.pushReplacement(context, route);
							});
						}
					});
				} else {
					FirebaseAuthException exception = FirebaseAuthException(code: 'username-already-in-use', message: 'Username already in use');
					throw exception;
				}
			}).onError((error, stackTrace) {
				if (error.code == "username-already-in-use") {
					errorMessage = "Username already in use";
				}
			});
		} on FirebaseAuthException catch (e) {
			if (e.code == "email-already-in-use") {
				errorMessage = "Email already in use";
			} else if (e.code == "weak-password") {
				errorMessage = "Password weak";
				editPassword.clear();
			} else if (e.code == "invalid-email") {
				errorMessage = "Email format invalid";
			} else if (e.code == "password-does-not-same") {
				errorMessage = "Password not same";
			} else if(e.code == "username-empty") {
				errorMessage = "Username could not be empty";
			} else if(e.code == "display-name-empty") {
				errorMessage = "Display Name could not be empty";
			} else if(e.code == "password-empty") {
				errorMessage = "Password or password repeat could not be empty";
			} else if(e.code == "password-length") {
				errorMessage = "Password or password repeat length could not less than 6";
			} 
		} on Exception catch(e) {
			print(e);
		} 

		setState(() {
			isLoading = false;
		});
	}
}