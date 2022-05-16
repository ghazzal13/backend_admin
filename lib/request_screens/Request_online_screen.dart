import 'package:auction_admin/screens/online_posts_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestOnlineScreen extends StatefulWidget {
  const RequestOnlineScreen({Key? key}) : super(key: key);

  @override
  _RequestOnlineScreenState createState() => _RequestOnlineScreenState();
}

class _RequestOnlineScreenState extends State<RequestOnlineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/BackGround.jpg'),
        )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OnlinePostsScreen(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 400),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.teal.withOpacity(0.2),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: CircleAvatar(
                                                radius: 30,
                                                backgroundColor: Colors.teal,
                                                backgroundImage: NetworkImage(
                                                    'https://as2.ftcdn.net/v2/jpg/00/65/77/27/1000_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg'),
                                              ),
                                            ),
                                            Text(
                                              'UserName',
                                              style: TextStyle(
                                                color: Colors.teal[600],
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          // alignment: Alignment.topLeft,
                                          //margin: EdgeInsets.fromLTRB(12,5,320,400),
                                          child: Text(
                                            'Item Name',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.teal[600],
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        //margin: EdgeInsets.fromLTRB(12,5,320,400),
                                        child: Text(
                                          'Title',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.teal[600],
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        //margin: EdgeInsets.fromLTRB(12,0,320,400),
                                        child: Text(
                                          'Data Data Data',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.teal[600],
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Stack(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              // color: Colors.teal[400],
                                            ),
                                            child: TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                'First Price',
                                                style: TextStyle(
                                                    color: Colors.teal,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              //color: Colors.teal,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              height: 140,
                                              //margin: new EdgeInsets.fromLTRB(200,0,0,0),
                                              // color: Colors.black87,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      "https://i.pinimg.com/564x/70/f9/dd/70f9dd78e5d27729b98d74cdd4c78484.jpg"),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Container(
                                              child: Text(
                                                'Category',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.teal,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        alignment: Alignment.bottomLeft,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            minimumSize: Size(180, 40),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            primary: Colors.teal[500],
                                          ),
                                          child: Container(
                                            //margin: EdgeInsets.all(8.0),
                                            child: Text(
                                              'Submit',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'halter',
                                                fontSize: 30,
                                              ),
                                            ),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ),
                                  ),
                                  //SizedBox(width: 30,),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(180, 40),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          primary: Colors.teal[500],
                                        ),
                                        child: Container(
                                          // margin: EdgeInsets.all(8.0),
                                          child: Text(
                                            'Cancel',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'halter',
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
