import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:samachar/screens/home/homepage.dart';
import 'constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  void changePage (int index ){
      setState(() {
        currentIndex = index;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
//            SizedBox(height: 30,),
            DrawerHeader(child: Container(
              height: 140,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/Samachaar1.png'),
            )),
            SizedBox(height: 40,),
            GestureDetector(
              child: Text('About',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff053742)
                ),
              ),
            ),
            SizedBox(height: 45,),
            Text('Profile',
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff053742)
              ),
            ),
            SizedBox(height: 45,),
            Text('Settings',
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff053742)
              ),
            ),
            SizedBox(height: 45,),
            Text('Log out',
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff053742)
              ),
            ),
            SizedBox(height: 45,),
            Material(
              borderRadius: BorderRadius.circular(500),
              child: InkWell(
                borderRadius: BorderRadius.circular(500),
                splashColor: Colors.black45,
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black,
                  child: Icon(Icons.arrow_back, color: Colors.white,),
                ),
              ),
            ),
          ],
        )
      ),
      bottomNavigationBar: BubbleBottomBar(
          opacity: 0.1,
          currentIndex: currentIndex,
          onTap: changePage,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          elevation: 8,
          hasNotch: true, //new
          items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(backgroundColor: Color(0xffCD113B), icon: Icon(Icons.dashboard, color: Color(0xffCD113B),), activeIcon: Icon(Icons.dashboard, color: Color(0xffCD113B),), title: Text("Home")),
          BubbleBottomBarItem(backgroundColor: Color(0xff52006A), icon: Icon(Icons.search, color:  Color(0xff52006A),), activeIcon: Icon(Icons.search, color:  Color(0xff52006A),), title: Text("Search")),
          BubbleBottomBarItem(backgroundColor: Color(0xffFF7600), icon: Icon(Icons.bookmark, color:  Color(0xffFF7600),), activeIcon: Icon(Icons.bookmark, color:  Color(0xffFF7600),), title: Text("Bookmarks")),
          BubbleBottomBarItem(backgroundColor:  Color(0xffFFA900), icon: Icon(Icons.person,color: Color(0xffFFA900),), activeIcon: Icon(Icons.person, color:  Color(0xffFFA900),), title: Text("Profile"))
      ],
    ),
      body:<Widget>[
        HomePage(),
        Container(color: Colors.white,),
        Container(color: Colors.white,),
        Container(color: Colors.white,),
      ][currentIndex],
    );
  }
}
