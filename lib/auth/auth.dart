import 'package:firebase_auth/firebase_auth.dart';

class Auth {
	FirebaseAuth _auth = FirebaseAuth.instance;

	Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
		UserCredential credential = await _auth.signInWithEmailAndPassword(
			email: email, 
			password: password
		);

		return credential;
	}

	Future<UserCredential> createUserWithEmailAndPassword(String email, String password) async {
		UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

		return credential;
	}

	User current(){
		return _auth.currentUser;
	}

	Future<bool> userHasLoggedIn() async {
		final subscription = _auth.authStateChanges().listen(null);
		bool hasLoggedIn = false;

		subscription.onData((event) async {
			if (event != null) {
				hasLoggedIn = true;
			}

			subscription.cancel();
		});

		return hasLoggedIn;
	}

	void logout(){
		_auth.signOut();
	}

}