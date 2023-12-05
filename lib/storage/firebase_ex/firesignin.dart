import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'firesignup.dart';
import 'firebaseHelper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firehome.dart';
import 'package:google_fonts/google_fonts.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //options: FirebaseOptions(apiKey: "AIzaSyAoxIEUREOUsTMWuVhVKYQ0LsiF-_QjYJc", appId: "1:747884163142:android:a12318c122188ed7c59a47", messagingSenderId: '', projectId: "demoproject-1f95c")
  );
  User? user =FirebaseAuth.instance.currentUser;
  runApp(MaterialApp(
    home:user==null? FireLogin():HomeFire(),
  ));
}

class FireLogin extends StatefulWidget {
  const FireLogin({Key? key}) : super(key: key);

  @override
  State<FireLogin> createState() => _FireLoginState();
}

class _FireLoginState extends State<FireLogin> {
  final uname = TextEditingController();
  final passwd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        //title:  Text("login page"),
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
               Text( "login",style: GoogleFonts.lato(
                fontSize: 30,
                color: Colors.black,
                fontStyle: FontStyle.italic,
                 fontWeight: FontWeight.bold
              ),),
               Text( "Welcome back,login with your credentials",style: GoogleFonts.lato(
                 fontSize: 20,
                 color: Colors.black,
                 fontStyle: FontStyle.italic,
               ),),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: uname,
                  decoration:  InputDecoration(border: OutlineInputBorder(),
                      labelText: "username",labelStyle: GoogleFonts.lato(
                        fontSize: 20,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                      ),
                      prefixIcon: Icon(Icons.person),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:
                        Colors.grey)),),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  obscureText:true,
                  obscuringCharacter: '*',
                  controller: passwd,
                  decoration:  InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                      labelText: "password",
                    labelStyle: GoogleFonts.lato(
                      fontSize: 20,
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                    ),
                      prefixIcon: Icon(Icons.visibility_off),

                        focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:
                        Colors.grey)),
                ),),
                ),


              MaterialButton( shape:StadiumBorder(),color: Colors.yellow[700],
                  onPressed: () {
                    String username = uname.text.trim();
                    String password =passwd.text.trim();   //123456789@jesleenaiqbal09

                    FireHelper().signIn(email:username,pass:password).then((value) {
                      if(value == null){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeFire()));
                      }else{
                        ScaffoldMessenger.of(context).
                        showSnackBar(SnackBar(content: Text(value)));
                      }
                    });
                  },
                  child:  Text("Login Here",style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),),),

              const SizedBox(
                height: 10,
              ),

              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FireSignup()));
                  },
                  child:  Text("Dont have an account? Register Here",style: GoogleFonts.lato(
                    fontSize: 20,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),),),



            ], ),),),);}}