import 'package:flutter/material.dart';
import 'firebasehelper.dart';
import 'firesignin.dart';
import 'package:google_fonts/google_fonts.dart';
class HomeFire extends StatelessWidget {
  const HomeFire({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/firebase.png',  height: 300, width: 300, ),
            MaterialButton(
              shape: StadiumBorder(),
              color: Colors.yellow[700],
                onPressed: () {
                  FireHelper().signOut().then((value) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => FireLogin()));
                  });
                },
                child: Text("SignOut",style: GoogleFonts.lato(
                  fontSize: 20,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),),),

          ],
        ),
      ),
    );
  }
}