import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:instagram/screens/add_post_screen.dart';
import 'package:instagram/screens/feeds_screen.dart';
import 'package:instagram/screens/profile_screen.dart';
import 'package:instagram/screens/search_screen.dart';

import '../api/home_pages.dart';



const webScreenSize = 600;


List<Widget> homeScreenItems = [
 //FeedScreen(),
 SearchScreen(),
 AddPostScreen(),
 MyApp(),
 //Text('notificacion'),
 ProfileScreen(
     uid: FirebaseAuth.instance.currentUser!.uid,
 ),



];