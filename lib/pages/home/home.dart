import 'package:flutter/material.dart';
import 'package:flutterfirebase/assets/app_color.dart';
import 'package:flutterfirebase/auth/auth.dart';
import 'package:flutterfirebase/callback.dart';
import 'package:flutterfirebase/includes/app_bar.dart';
import 'package:flutterfirebase/includes/bottom_bar.dart';
import 'package:flutterfirebase/pages/account/account.dart';
import 'package:flutterfirebase/pages/feed/feed.dart';
import 'package:flutterfirebase/pages/login/login.dart';
import 'package:flutterfirebase/pages/post/post.dart';
import 'package:flutterfirebase/pages/register/register.dart';

class HomePage extends StatefulWidget {
	@override
	_Page createState() => _Page();
}

class _Page extends State<HomePage> {

	int _pageSelected = 0;
	int _basePageIndex = 0;
	bool isPageLoaded = true;
	Auth auth = Auth();

	@override
	void initState(){
		super.initState();

		setBasePage(auth.current() == null ? 1 : 0);
	}

	void setBasePage(int base) {
		setState(() {
			_basePageIndex = base;
		});
	}

	@override
	Widget build(BuildContext context) {

		List<Widget> _pages = <Widget>[
			Feed(),
			Post(),
			Account(setBasePage: setBasePage),
		];

		return createBasePage(_basePageIndex, _pages);
	}

	Widget createBasePage(int base, List<Widget> pages){
		if (base == 1) {
			return LoginPage(setBasePage: setBasePage,);
		} else if (base == 2) {
			return RegisterPage(setBasePage: setBasePage,);
		}
		return body(pages);
	}

	Widget body(List<Widget> pages){
		return Scaffold(
			appBar: baseAppBar(context),
			// body: isPageLoaded ? _pages.elementAt(_pageSelected) : Text("loading"),
			body: IndexedStack(
				index: _pageSelected,
				children: pages,
			),
			bottomNavigationBar: baseBottomNavigationBar((index) {
				setState(() {
					_pageSelected = index;
				});
			}, _pageSelected),
		);
	}
}