

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/screens/add_post_screen.dart';
import 'package:instagram/utils/colors.dart';
import 'package:instagram/utils/global_variable.dart';
class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 1;
  late PageController pageController; // for tabs animation

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: homeScreenItems,
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor:mobilBackgroundColor ,
        items: <BottomNavigationBarItem>[

          /*BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: (_page == 0) ? primaryColor : secodaryColor,
            ),
            label: 'Inicio',
              backgroundColor: Colors.red,
          ),*/

          BottomNavigationBarItem(
              icon: Icon(
                Icons.photo,
                color: (_page == 1) ? primaryColor : secodaryColor,

              ),

              label: 'Mostrar',
            backgroundColor: Colors.green),
          BottomNavigationBarItem(

              icon: Icon(
                Icons.add_circle,
                color: (_page == 2) ? primaryColor : secodaryColor,
              ),
              label: 'Agregar',
              backgroundColor: Colors.purple),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: (_page == 3) ? primaryColor : secodaryColor,
            ),
            label: 'Api',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: (_page == 4) ? primaryColor : secodaryColor,
            ),
            label: 'Perfil',
            backgroundColor: Colors.blue,
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),

    );
  }
}