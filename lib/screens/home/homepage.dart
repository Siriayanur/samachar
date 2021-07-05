import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController;
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(length: null,vsync: null);
  }
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(headerSliverBuilder: (context,value) {
      return [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(25, 10, 25, 25),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Hot news",style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 34,
                fontWeight: FontWeight.bold
              ),textAlign: TextAlign.left,),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child:Container(
            padding: EdgeInsets.only(left: 25),
            alignment: Alignment.centerLeft,
            child: TabBar(labelPadding: EdgeInsets.only(right: 15),
            indicatorSize: TabBarIndicatorSize.label,),
          )
        ),
      ];
    },body: Container());
  }
}
