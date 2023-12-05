import 'package:flutter/material.dart';
import 'firesignin.dart';
import 'firebaseHelper.dart';
import 'package:google_fonts/google_fonts.dart';
class FireSignup extends StatefulWidget {
  const FireSignup({Key? key}) : super(key: key);

  @override
  State<FireSignup> createState() => _FireSignupState();
}

class _FireSignupState extends State<FireSignup> {
  final remail = TextEditingController();
  final rpasswd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
       // title: Text("signup page"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Image.asset('assets/firebase.png',  height: 100, width: 100, ),
              Text( "SignUp",style: GoogleFonts.lato(
                  fontSize: 30,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold
              ),),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: remail,
                  decoration:  InputDecoration(border: OutlineInputBorder(),
                      labelText: "username",labelStyle: GoogleFonts.lato(
                    fontSize: 20,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                      prefixIcon: Icon(Icons.person)),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  obscureText:true,
                  obscuringCharacter: '*',
                  controller: rpasswd,
                  decoration:  InputDecoration(border: OutlineInputBorder(),
                      labelText: "password",labelStyle: GoogleFonts.lato(
                    fontSize: 20,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                      prefixIcon: Icon(Icons.visibility_off)),
                ),
              ),

              MaterialButton(shape: StadiumBorder(),color: Colors.yellow[700],
                onPressed:()
              {

                String username = remail.text.trim();
                String password = rpasswd.text.trim();

                FireHelper().signUp(email: username, pwd: password).then((message)
                {
                  if (message == null)
                  {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>FireLogin()));
                  }

                  else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
                  }

                });
              },
                  child:  Text("Signup",style: GoogleFonts.lato(
                      fontSize: 20,
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold
                  ),),),

              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FireLogin()));
                },
                child:  Text("Already have an account? LogIn here",style: GoogleFonts.lato(
                  fontSize: 20,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),),),
            ], ),),),);}}

