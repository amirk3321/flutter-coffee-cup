import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coffee_app/model/coffee_model.dart';
import 'package:flutter_coffee_app/screens/pages/detail_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<CoffeeDataModel> data = [
    CoffeeDataModel("assets/Espresso.png", "Espresso"),
    CoffeeDataModel("assets/Cappuccino.png","Cappuccino"),
    CoffeeDataModel("assets/latte.png","latte"),
    CoffeeDataModel("assets/macciato1.png","Macciato"),
  ];
  int _index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index){
          setState(() {
            _index=index;
          });
        },
        height: 55,
        backgroundColor: Colors.transparent,
        items: <Widget>[
          Icon(Icons.home,color: _index==0?Colors.brown:Colors.black,),
          Icon(Icons.location_on,color: _index==1?Colors.brown:Colors.black,),
          Icon(Icons.person,color: _index==2?Colors.brown:Colors.black,),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            _rowHeaderWidget(),
            SizedBox(
              height: 15,
            ),
            _rowTextWidget(),
            SizedBox(
              height: 15,
            ),
            _listWidget(),
          ],
        ),
      ),
    );
  }

  Widget _rowHeaderWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Image.asset('assets/Group 11.png'),
        ),
        Container(
          child: Image.asset('assets/Group 5.png'),
        ),
      ],
    );
  }

  _rowTextWidget() {
    return Row(
      children: <Widget>[
        Text(
          "It's Great ",
          style: TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(
          "Day for Coffee.",
          style: TextStyle(
              fontSize: 22,
              color: Colors.brown[500],
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  _listWidget() {
    return Expanded(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (_) => DetailPage(title: data[index].title,img: data[index].image,),
              ));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: 70,
                        width: 70,
                        child: Image.asset(data[index].image),
                      ),
                      SizedBox(width: 30,),
                      Container(
                        child: Text(data[index].title,style: TextStyle(fontSize: 16),),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
