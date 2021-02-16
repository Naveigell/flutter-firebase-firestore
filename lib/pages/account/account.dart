import 'package:flutter/material.dart';
import 'package:flutterfirebase/assets/app_color.dart';
import 'package:flutterfirebase/auth/auth.dart';

typedef void SetBasePage(int base);

class Account extends StatelessWidget {

	Auth _auth = Auth();
	SetBasePage setBasePage;

	Account({this.setBasePage});

	@override
	Widget build(BuildContext context) {
		
		return Container(
			padding: EdgeInsets.all(20),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.stretch,
				mainAxisAlignment: MainAxisAlignment.end,
				children: [
					Container(
						child: ElevatedButton(
							child: Text(
								"Logout",
								style: TextStyle(
									fontSize: 15.0,
									fontFamily: 'RobotoRegular',
									color: Colors.white
								),
							),
							onPressed: () {
								_auth.logout();
								this.setBasePage(1);
								// Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (c) => MainApp()), (route) => false);
								// Navigator.of(context).pop();
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