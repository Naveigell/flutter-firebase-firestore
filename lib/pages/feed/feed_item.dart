import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase/assets/app_color.dart';
import 'package:flutterfirebase/auth/auth.dart';
import 'package:flutterfirebase/dialog/dialog_box.dart';

class FeedItem extends StatefulWidget {

	Map<String, dynamic> data = Map();
	Map<String, dynamic> user = Map();
	Auth _auth = Auth();

	int index;
	String id;

	FeedItem({this.data, this.index, this.user, this.id});

	@override _FeedItem createState() => _FeedItem();
}

class _FeedItem extends State<FeedItem> {

	bool isCaptionExpanded = false;

	Widget deleteAndUpdateButton(){
		if (widget._auth.current() == null) {
			return SizedBox.shrink();
		}

		void closeDialog(){
			Navigator.of(context, rootNavigator: true).pop();
		}

		if (widget._auth.current().uid == widget.data["user_uid"]) {
			return Row(
				children: [
					GestureDetector(
						child: Text(
							"Update",
							style: TextStyle(
								color: AppColor.yellowPrimary,
							),
						),
						onTap: (){
							showDialog(
								context: context, 
								// barrierDismissible: false,
								builder: (BuildContext ctx){
									return DialogBox().inputDialog("Update Content", widget.data["caption"], (String input) {
										FirebaseFirestore.instance.collection("posts").doc(widget.id).update({
											"caption": input
										});
										closeDialog();
									}, closeDialog);
								}
							);
						},
					),
					SizedBox(width: 20,),
					GestureDetector(
						child: Text(
							"Delete",
							style: TextStyle(
								color: AppColor.redPrimary,
							),
						),
						onTap: (){
							showDialog(
								context: context, 
								// barrierDismissible: false,
								builder: (BuildContext ctx){
									return DialogBox().yesNoDialog(
										"Delete Content", 
										"Are you sure? The content will permanent deleted. You cannot undone this action", 
										(){
											closeDialog();
											FirebaseFirestore.instance.collection("posts").doc(widget.id).delete().onError((error, stackTrace) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Delete failed"),)));
										}, 
										closeDialog
									);
								}
							);
						},
					)
				],
			);
		}
		
		return SizedBox.shrink();
	}

	@override
	Widget build(BuildContext context) {
		return Card(
			child: Container(
				padding: EdgeInsets.only(top: 20, bottom: 20),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.stretch,
					children: [
						Container(
							padding: EdgeInsets.only(left: 10, right: 10),
							child: Row(
								mainAxisAlignment: MainAxisAlignment.spaceBetween,
								children: [
									Text(
										widget.user.length == 0 ? "" : widget.user["username"],
										style: TextStyle(
											fontFamily: "MontserratBold",
											fontSize: 15
										),
									),
									Spacer(),
									deleteAndUpdateButton(),
								],
							),
						),
						Container(
							margin: EdgeInsets.only(top: 12, left: 10, right: 10),
							child: Text(
								// "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent quis lacus libero. Cras vitae justo lobortis sapien mattis tempus non at nisi. Sed vel sodales urna. Aenean efficitur felis non mi tristique, eget sollicitudin tellus cursus. Donec ultricies eros et interdum rutrum. Vivamus iaculis aliquam ex in vestibulum. Nam quam erat, finibus hendrerit euismod vitae, tristique eget urna. Aenean id maximus nunc. Morbi ornare at leo sed gravida. Phasellus id metus bibendum, laoreet dui id, pharetra mi. Cras pulvinar efficitur diam, lacinia mattis ex aliquet ut. Vivamus bibendum tincidunt felis, sit amet tincidunt nibh suscipit at. Fusce sed venenatis ex, sed dictum quam. ",
								widget.data["caption"],
								style: TextStyle(
									fontFamily: "RobotoRegular",
									fontSize: 15
								),
								maxLines: isCaptionExpanded ? null : 3,
								overflow: !isCaptionExpanded ? TextOverflow.ellipsis : TextOverflow.visible,
							),
						),
					],
				),
			),
		);
	}
}