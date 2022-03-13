import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram/provider/user_provider.dart';
import 'package:instagram/reponsive/responsive_layout_screen.dart';
import 'package:instagram/reponsive/web_screen_layout.dart';
import 'package:instagram/reponsive/mobil_screnn_layout.dart';
import 'package:instagram/screens/login_screen.dart';
import 'package:instagram/screens/signup_screen.dart';
import 'package:instagram/utils/colors.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyAquoToMRRHJRtIP57Gm5K4T27UWHR5upQ",
      appId: "1:497545869752:web:b4da93e2d468245a60374d",
      messagingSenderId: "497545869752",
      projectId: "instagram-6eec9",
      storageBucket: "instagram-6eec9.appspot.com",
    ));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_)=>UserProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instragram Web',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobilBackgroundColor,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            if(snapshot.connectionState== ConnectionState.active){
              if(snapshot.hasData){
                return const ResponsiveLayout(
                  mobilScreenLayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout(),
                );
              }else if(snapshot.hasError){
                return Center(
                  child: Text('${snapshot.error}'),
                );

              }
            }
            if(snapshot.connectionState== ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            }
            return const LoginScreen();
          }
        ),
        /*const ResponsiveLayout(
          mobilScreenLayout: MobilScreenLayout(),
          webScreenLayout: WebScreenLayout(),*/
      ),
    );
  }
}
