import 'package:flutter/material.dart';
import 'package:flutterfirebase/includes/bottom_bar_key.dart';

BottomNavigationBar baseBottomNavigationBar(void onItemTap(int), int index){

	GlobalKey key = getGlobalKey();

	return BottomNavigationBar(
		key: key,
		items: const <BottomNavigationBarItem>[
			BottomNavigationBarItem(
				icon: Icon(Icons.home),
				label: 'Home',
			),
			BottomNavigationBarItem(
				icon: Icon(Icons.add),
				label: 'Post',
			),
			BottomNavigationBarItem(
				icon: Icon(Icons.person),
				label: 'Account',
			),
		],
		selectedItemColor: Colors.black,
		unselectedItemColor: Colors.black54,
		showUnselectedLabels: true,
		showSelectedLabels: true,
		onTap: onItemTap,
		currentIndex: index,
	);
}