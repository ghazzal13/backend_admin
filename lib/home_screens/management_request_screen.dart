import 'package:auction_admin/request_screens/request_online_screen.dart';
import 'package:auction_admin/request_screens/request_offline_screen.dart';
import 'package:auction_admin/request_screens/trade_request_screen.dart';
import 'package:flutter/material.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key}) : super(key: key);

  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.teal,
          title: const Text(
            'Request',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          bottom: TabBar(
              unselectedLabelColor: Colors.green.shade300,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.teal.shade300, Colors.tealAccent.shade400]),
                borderRadius: BorderRadius.circular(30),
                // color: Colors.teal.shade200,
              ),
              tabs: [
                Container(
                    decoration: (BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white10, width: 1),
                    )),
                    alignment: Alignment.center,
                    child: const Tab(
                      text: ('Online Auction'),
                    )),
                Container(
                    decoration: (BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white10, width: 1),
                    )),
                    alignment: Alignment.center,
                    child: const Tab(
                      text: ('Offline Auction'),
                    )),
                Container(
                    decoration: (BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white10, width: 1),
                    )),
                    alignment: Alignment.center,
                    child: const Tab(
                      text: ('Trade'),
                    )),
              ]),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/BackGround.jpg'),
          )),
          child: const Center(
            child: TabBarView(children: [
              RequestOnlineScreen(),
              RequestOfflineScreen(),
              MainRequestScreen(),
            ]),
          ),
        ),
      ),
    );
  }
  /*
    Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
        title: const Text(
          'Managment Users',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/BackGround.jpg'),
        )),
        child: SingleChildScrollView(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('posts').snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                print('ConnectionState is waiting');
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                print('ConnectionState is has data');
              }
              if (snapshot.hasError) {
                print('ConnectionState is has error');
              }
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (ctx, index) => Container(
                  margin: const EdgeInsets.symmetric(
                      // horizontal: width > webScreenSize ? width * 0.3 : 0,
                      // vertical: width > webScreenSize ? 15 : 0,
                      ),
                  child: Usercard(
                    context: context,
                    snap: snapshot.data!.docs[index].data(),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget Usercard({required dynamic snap, context}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.teal,
                  backgroundImage: NetworkImage(
                    snap['image'].toString(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  snap['name'].toString(),
                  style: TextStyle(
                    color: Colors.teal[600],
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                    '${DateFormat.yMd().add_jm().format(snap['postTime'].toDate())} '),
              ],
            ),
            const Spacer(),
            PopupMenuButton(
              onSelected: (value) {
                if (value.toString() == '/delete') {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text("Delete User"),
                      content: const Text(
                          "Are you sure you want to Delete This User?"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'NO'),
                          child: const Text('NO'),
                        ),
                        TextButton(
                          onPressed: () {
                            AuctionCubit.get(context)
                                .deletDoc('users', snap['uid'].toString());
                            Navigator.pop(context, 'YES');
                          },
                          child: const Text('YES'),
                        ),
                      ],
                    ),
                  );
                }
              },
              itemBuilder: (BuildContext bc) {
                return const [
                  PopupMenuItem(
                    child: Text("delete"),
                    value: '/delete',
                  ),
                ];
              },
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  snap['titel'].toString(),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.teal[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                  ' ${DateFormat.yMd().add_jm().format(snap['startAuction'].toDate())}  '),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              child: Text(
                snap['description'].toString(),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.teal[600],
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              snap['category'].toString(),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.teal,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  snap['postImage'].toString(),
                ),
                fit: BoxFit.cover),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Cancel',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'accept',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

/*
      /////////////////////////////////////////////////////////////////////////////////////////////////////
       Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/BackGround.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('posts').snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                print('ConnectionState is waiting');
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                print('ConnectionState is has data');
              }
              if (snapshot.hasError) {
                print('ConnectionState is has error');
              }
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (ctx, index) => Container(
                        margin: const EdgeInsets.symmetric(
                            // horizontal: width > webScreenSize ? width * 0.3 : 0,
                            // vertical: width > webScreenSize ? 15 : 0,
                            ),
                        child: PostCard3(
                          snap: snapshot.data!.docs[index].data(),
                          context: context,
                        ),
                      ));
            },
          ),
        ),
      ),
    );
  }
}

Widget PostCard3({ required dynamic snap, context,}) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 5,
      right: 5,
      top: 5,
    ),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.teal.withOpacity(0.2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.teal,
                          backgroundImage: NetworkImage(
                            snap['image'].toString(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snap['name'].toString(),
                          style: TextStyle(
                            color: Colors.teal[600],
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                            '${DateFormat.yMd().add_jm().format(snap['postTime'].toDate())} '),
                      ],
                    ),
                    const Spacer(),
                    PopupMenuButton(
                      onSelected: (value) {
                        if (value.toString() == '/Delete') {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('AlertDialog Title'),
                              content: const Text('AlertDialog description'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    AuctionCubit.get(context).deletDoc(
                                        'posts', snap['postId'].toString());
                                    Navigator.pop(context, 'OK');
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else if (value.toString() == '/Edit') {}
                      },
                      itemBuilder: (BuildContext bc) {
                        return const [
                          PopupMenuItem(
                            child: Text("Delete"),
                            value: '/Delete',
                          ),
                          PopupMenuItem(
                            child: Text("Edit"),
                            value: '/Edit',
                          ),
                        ];
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snap['titel'].toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.teal[600],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                                ' ${DateFormat.yMd().add_jm().format(snap['startAuction'].toDate())}  '),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            child: Text(
                              snap['description'].toString(),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.teal[600],
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            snap['category'].toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.teal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              snap['postImage'].toString(),
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'accept',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
 }
 */


 /*
   

    /*Scaffold(
      resizeToAvoidBottomInset: false,
     appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Trade',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        actions: [
          PopupMenuButton(
            color: Colors.teal.withOpacity(0.7),
              tooltip: 'Menu',
              child: Icon(
                Icons.more_vert,
                size: 28.0,
                color: Colors.white,
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(
                          builder: (context) => RequestOnlineScreen(),
                        ),
                        );
                      },
                      child: Text(
                        'Online Auction',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    )),
                PopupMenuItem(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(
                          builder: (context) => RequestOfflineScreen(),
                        ),
                        );
                      },
                      child: Text(
                        'Offline Auction',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    )),
                PopupMenuItem(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(
                          builder: (context) => RequestScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Trade',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    )),
              ]),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  'assets/BackGround.jpg'),
            )),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: GestureDetector(
                onTap:(){
                  Navigator.push(context,MaterialPageRoute(
                    builder: (context) => TradePostsScreen(),
                  ),
                  );
                },
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
                                      padding: const EdgeInsets.all(8.0),
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
                                    'Item I Have',
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
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      // color: Colors.teal[400],
                                    ),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Item I Need',
                                        style: TextStyle(
                                          color: Colors.teal,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      //color: Colors.teal,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
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
                                      borderRadius: BorderRadius.circular(30),
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
                                    borderRadius: BorderRadius.circular(30),
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
            ),


          ],
        ),
      ),
    );*/
  }
}
 */*/
}
