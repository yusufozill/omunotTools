
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/omunotexam/res/customColors.dart';
import '/omunotexam/screens/user_info_screen.dart';
import '/omunotexam/utils/authentication.dart';
import '/omunotexam/widgets/google_sign_in_button.dart';
import 'package:url_launcher/url_launcher.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);



  @override
  _SignInScreenState createState() => _SignInScreenState();
}
 bool yenibool=false;
class _SignInScreenState extends State<SignInScreen> {

bool bekleyecekmiyiz=true;
   
 @override
  void initState() {
    //print("sign in screen");
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      setState(() {
      bekleyecekmiyiz=false;  
      });
     debugPrint('User is currently signed out!');
      
   

    } else {
         
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => UserInfoScreen(
                        user: user,
                      ),
                    ),
                  );
                
             //print('User is signed in!');
    }
  });
    super.initState();
  }
          void _launchURL(url) async {
  if (!await launch(url, )) throw 'Could not launch $url';
}
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Center(
            child: 
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max ,
                  children: [
                    const SizedBox(height: 80),

                    SizedBox (width:250,height: 250,child: Image.asset("assets/icon.png")),
                       const Expanded(child: Text(""),),
                    
                    FutureBuilder(
                      future: Authentication.initializeFirebase(context: context),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Error initializing Firebase');
                        } else  {
                          return GoogleSignInButton( const Key("GoogleSignInButton"),girildimi: bekleyecekmiyiz,);
                        }
                      },
                    ),
                
                  
                     const Padding(
                      padding: EdgeInsets.only(bottom:8.0),
                      child:  Text("* Üniversite hesabınla giriş yapmalısın", style: TextStyle(fontSize: 15,  color: CustomColors.atention, ),)),
                        
                  
                    
                      InkWell(
                       onTap: () {
                            
                      _launchURL("https://www.omunot.com/omunot/privacypolicy.html");

                        
                       },
                        child:  const Text("Gizlilik Politikası", style: TextStyle(fontSize: 15,  color: CustomColors.black , decoration:  TextDecoration.underline ),),
                  ),
                    const SizedBox(height: 50),
                    



                  const Text("Yusuf Özil",style: TextStyle( color: Colors.black, fontSize:15, fontFamily:'Charmonman' )),


              
                  ],
                ),
              
            ),
          ),
        );
    
  }
}
