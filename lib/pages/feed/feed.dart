import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase/auth/auth.dart';
import 'package:flutterfirebase/helper/state.dart';

import 'feed_item.dart';

class Feed extends StatefulWidget {
	@override
	_Feed createState() => _Feed();
}

class _Feed extends State<Feed> {

	List<FeedItem> _feeds = [];

	void initState(){
		super.initState();

		retrieveFeed();
	}

	void childExists(bool isExists, int index){
		StateHelper.setStateIfMounted(this, (){
			// _feeds.removeAt(index);
		});
	}
	
	void retrieveFeed() {
		FirebaseFirestore.instance.collection("posts").snapshots().listen((QuerySnapshot event) {
			_feeds.clear();
			event.docs.asMap().forEach((index, element) async {
				Map<String, dynamic> user; 

				await retrieveFeedUser(element.data()["user_uid"]).then((value) => user = value).catchError((Object error){ print("error"); });

				if (user == null)
					return;

				StateHelper.setStateIfMounted(this, () {
					_feeds.add(FeedItem(data: element.data(), index: index, user: user, id: element.id,));
				});
			});
		});
	}

	Future<Map<String, dynamic>> retrieveFeedUser(String uid) async {
		Map<String, dynamic> user;

		await FirebaseFirestore.instance.collection("users").doc(uid).get().then((DocumentSnapshot snapshot) {
			StateHelper.setStateIfMounted(this, (){
				if (snapshot.data() != null) {
					user = Map();
					user = snapshot.data();
				}
			});
		});

		return user;
	}

	@override
	Widget build(BuildContext context) {
		return Container(
			color: Colors.grey[200],
			child: ListView.builder(
				itemBuilder: (item, index) {
					return _feeds[index];
				},
				itemCount: _feeds.length,
			) ,
		);
	}
}