import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase/assets/app_color.dart';
import 'package:flutterfirebase/auth/auth.dart';
import 'package:flutterfirebase/includes/bottom_bar.dart';
import 'package:flutterfirebase/includes/bottom_bar_key.dart';

class Post extends StatelessWidget {

	Auth _auth = Auth();

	@override
	Widget build(BuildContext context) {
		TextEditingController inputController = TextEditingController();
		
		return Container(
			padding: EdgeInsets.all(20),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.stretch,
				children: [
					Text(
						"Post Content",
						style: TextStyle(
							fontSize: 20.0,
							fontFamily: 'MontserratBold',
						),
					),
					SizedBox(height: 20,),
					TextFormField(
						controller: inputController,
						decoration: InputDecoration(
							contentPadding: EdgeInsets.all(20),
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
							hintText: "Lorem ipsum ...."
						),
						minLines: 7,
						maxLines: 7,
						style: TextStyle(
							fontSize: 17
						),
					),
					SizedBox(height: 20,),
					Container(
						child: ElevatedButton(
							child: Text(
								"Save",
								style: TextStyle(
									fontSize: 15.0,
									fontFamily: 'RobotoRegular',
									color: Colors.white
								),
							),
							onPressed: () {
								if (inputController.text.isEmpty) {
									ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Input is empty"),));
								} else if (_auth.current() != null) {
									FirebaseFirestore.instance.collection("posts").add({
										"caption": inputController.text,
										"user_uid": _auth.current().uid
									}).then((value) {
										final BottomNavigationBar navigationBar = getGlobalKey().currentWidget;
										navigationBar.onTap(0);

									 	ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Content Created"),));
									});
								}
							},
							style: ElevatedButton.styleFrom(
								primary: AppColor.redPrimary,
								padding: EdgeInsets.only(top: 20, bottom: 20),
								elevation: 0,
								shape: RoundedRectangleBorder(
									borderRadius: BorderRadius.all(Radius.circular(7))
								)
							),
						),
					),
				],
			),
		);
	}

}