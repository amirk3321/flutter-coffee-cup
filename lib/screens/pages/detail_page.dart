import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DetailPage extends StatefulWidget {
  final String img;
  final String title;

  const DetailPage({Key key, this.img, this.title}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int count = 0;
  int _selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body: Column(
        children: <Widget>[
          _headerWidget(),
          _bodyWidget(),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text(
                  "Add to cart",
                  style: TextStyle(fontSize: 18,color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _headerWidget() {
    return Container(
      height: 250,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Container(
            height: 250,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              child: Image.asset(
                "assets/background.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios)),
                  Text(
                    widget.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text("")
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
                width: 80,
                height: 80,
                child: Image.asset(
                  widget.img,
                  fit: BoxFit.contain,
                )),
          )
        ],
      ),
    );
  }

  Widget _bodyWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          setState(() {
                            count -= 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15))),
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "$count",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            count += 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                "RS:",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "260",
                style: TextStyle(fontSize: 18, color: Colors.brown),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Size",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          _selectSizeWidget(),
          SizedBox(
            height: 10,
          ),
          Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.",style: TextStyle(fontSize: 14,),)
        ],
      ),
    );
  }

  Widget _selectSizeWidget() {
    return Row(
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              _selectedSize = 0;
            });
          },
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: _selectedSize == 0
                            ? Colors.brown
                            : Colors.transparent,
                        width: 4))),
            child: Image.asset(
              widget.img,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            setState(() {
              _selectedSize = 1;
            });
          },
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: _selectedSize == 1
                            ? Colors.brown
                            : Colors.transparent,
                        width: 4))),
            child: Image.asset(
              widget.img,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            setState(() {
              _selectedSize = 2;
            });
          },
          child: Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: _selectedSize == 2
                            ? Colors.brown
                            : Colors.transparent,
                        width: 4))),
            child: Image.asset(
              widget.img,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
