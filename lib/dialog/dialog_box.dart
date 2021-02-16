import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase/assets/app_color.dart';
import 'package:flutterfirebase/dialog/callback.dart';

class DialogBox {
	Widget yesNoDialog(String title, String description, OnYes yes, OnNo no){
		return Dialog(
			shape: RoundedRectangleBorder(
				borderRadius: BorderRadius.all(Radius.circular(7))
			),
			child: Container(
				padding: EdgeInsets.all(20),
				child: Column(
					mainAxisSize: MainAxisSize.min,
					children: [
						Align(
							child: Text(
								title,
								style: TextStyle(
									fontFamily: "MontserratBold",
									fontSize: 20,
									fontWeight: FontWeight.bold
								),
							),
							alignment: Alignment.centerLeft,
						),
						SizedBox(
							height: 15,
						),
						Text(
							description,
							style: TextStyle(
								fontFamily: "RobotoRegular",
								fontSize: 15
							),
						),
						SizedBox(
							height: 19,
						),
						Row(
							mainAxisAlignment: MainAxisAlignment.end,
							children: [
								GestureDetector(
									child: Text(
										"CANCEL",
										style: TextStyle(
											fontFamily: "RobotoRegular",
											fontSize: 15,
											fontWeight: FontWeight.bold,
											color: Colors.black87
										),
									),
									onTap: no,
								),
								SizedBox(width: 20,),
								GestureDetector(
									child: Text(
										"OK",
										style: TextStyle(
											fontFamily: "RobotoRegular",
											fontSize: 15,
											fontWeight: FontWeight.bold,
											color: AppColor.redPrimary
										),
									),
									onTap: yes,
								),
							],
						),
					],
				),
			),
		);
	}

	Widget inputDialog(String title, String defaultText, OnInput input, OnNo no){

		TextEditingController inputController = TextEditingController();
		inputController.text = defaultText;

		return Dialog(
			shape: RoundedRectangleBorder(
				borderRadius: BorderRadius.all(Radius.circular(7))
			),
			child: Container(
				padding: EdgeInsets.all(20),
				child: Column(
					mainAxisSize: MainAxisSize.min,
					children: [
						Align(
							child: Text(
								title,
								style: TextStyle(
									fontFamily: "MontserratBold",
									fontSize: 20,
									fontWeight: FontWeight.bold
								),
							),
							alignment: Alignment.centerLeft,
						),
						SizedBox(
							height: 18,
						),
						TextFormField(
							controller: inputController,
							decoration: InputDecoration(
								contentPadding: EdgeInsets.only(left: 10, right: 10),
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
							style: TextStyle(
								fontSize: 17
							),
						),
						SizedBox(
							height: 19,
						),
						Row(
							mainAxisAlignment: MainAxisAlignment.end,
							children: [
								GestureDetector(
									child: Text(
										"CANCEL",
										style: TextStyle(
											fontFamily: "RobotoRegular",
											fontSize: 15,
											fontWeight: FontWeight.bold,
											color: Colors.black87
										),
									),
									onTap: no,
								),
								SizedBox(width: 20,),
								GestureDetector(
									child: Text(
										"OK",
										style: TextStyle(
											fontFamily: "RobotoRegular",
											fontSize: 15,
											fontWeight: FontWeight.bold,
											color: AppColor.greenPrimary
										),
									),
									onTap: (){
										input(inputController.text);
									},
								),
							],
						),
					],
				),
			),
		);
	}
}

