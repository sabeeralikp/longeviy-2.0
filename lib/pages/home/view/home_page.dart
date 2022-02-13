import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:longeviy/providers/google_sign_in_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(user.photoURL!),
              ),
              Text(user.displayName!),
              Text(user.email!),
              Text(user.uid),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.googleLogout();
                  },
                  child: const Text('Log Out'))
            ]),
      ),
    );
  }
}
