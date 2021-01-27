import 'package:flutter/material.dart';
import 'package:e_currency/global.dart';
void main() {
  runApp(
    RootRestorationScope( // <--fix
      restorationId: 'root',
      child: MaterialApp(home: Home()),
    ),
  );
}



class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key key}) : preferredSize = Size.fromHeight(60.0), super(key: key);



  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>{

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      actions: <Widget>[

        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            IconButton(
              icon:Icon(Icons.api),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Points()),
                );

              },
              color: Color(0xff39ff17),
            ),


            Text('Points: '),
            Text(Bar.points.toString()),

            SizedBox(width: 150.0,),

            IconButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Deposit()),
                );
              },
             icon: Icon(Icons.monetization_on),
              color: Color(0xff39ff17),
            ),

            SizedBox(width: 5.0,),

            Text('Coins: '),
            Text(Bar.balance.toString()),

          ],

        ),

      ],
    );
  }
}



class Deposit extends StatefulWidget {
  @override
  _DepositState createState() => _DepositState();
}

class _DepositState extends State<Deposit> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff39ff17),
          title: Text("Deposit Money"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              height: 250.0,
              width: 450.0,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(20.0),
                ),

                elevation: 10.0,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        SizedBox(height: 150.0,),

                        Text('Current Balance', style:TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,


                        )),


                      ],
                    ),
                    Text(Bar.balance.toString(), style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff39ff17),
                    ),)
                  ],
                ),

              ),
            ),

            SizedBox(height: 50.0,),
            Container(
              margin: EdgeInsets.all(9.0),
              height: 250.0,
              width: 450.0,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(20.0),
                ),

                elevation: 10.0,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        SizedBox(height: 150.0,),

                        RaisedButton(
                          onPressed: (){
                            setState(() {
                              Bar.balance +=2*2.5;
                            });
                          },
                          padding: EdgeInsets.fromLTRB(45, 25, 45, 25),
                          color: Color(0xff39ff17),
                          shape: RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(20.0),
                          ),
                          child: Text('Add 2BD'),
                        ),
                        SizedBox(width: 25.0,),

                        RaisedButton(
                          onPressed: (){
                            setState(() {
                              Bar.balance +=4*2.5;
                            });                        },
                          padding: EdgeInsets.fromLTRB(45, 25, 45, 25),

                          color: Color(0xff39ff17),
                          shape: RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(20.0),
                          ),
                          child: Text('Add 4BD'),
                        )



                      ],
                    ),
                    RaisedButton(
                      onPressed: (){
                        setState(() {
                          Bar.balance +=10*2.5;
                        });                    },
                      padding: EdgeInsets.fromLTRB(45, 25, 45, 25),

                      color: Color(0xff39ff17),
                      shape: RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(20.0),
                      ),
                      child: Text('Add 10BD'),
                    )
                  ],
                ),

              ),
            ),





          ],


        )
    );
  }
}






class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  List<String> items = [' ', '   ', '   '];
  int iter = 0;
  int total = 0;

  Widget build(BuildContext context) {
    return Scaffold(

      appBar: CustomAppBar(),
      backgroundColor: Color(0xff39ff17),
      body: Column(
        children: [
          Container(

            margin: EdgeInsets.all(2),
            height: 450,
            width: 400,

           child: Card(
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(20.0)
             ),
             elevation: 2.0,
             child:ListView(
               children: ListTile.divideTiles( //          <-- ListTile.divideTiles
                   context: context,
                   tiles: [
                     ListTile(
                       title: Text(items[0]),
                     ),
                     ListTile(
                       title: Text(items[1]),
                     ),
                     ListTile(
                       title: Text(items[2]),
                     ),

                   ]
               ).toList(),
             )
           ),

          ),

          Container(
            height: 287,
            width: 400,
            child: Card(

              shape: RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(20.0),
                ),

              elevation: 5.0,

              child: Column(


                children: [


                  Row(


                    children: [
                      SizedBox(width: 9.0, height: 90.0,),

                      RaisedButton(
                        elevation: 5.0,
                        padding: EdgeInsets.fromLTRB(60.0, 20.0, 60.0, 20.0),
                        onPressed: (){
                          setState(() {
                            iter +=1;
                                if(iter == 1){
                                  items[0] = 'Orange Juice 1.5L                   25';
                                  total += 25;
                                }
                                else if(iter == 2){
                                  items[1] = 'Instant Coffee Gold                    13';
                                  total += 13;

                                }
                                else if(iter == 3){
                                  items[2] = 'Wrapping Paper                    6';
                                  total += 6;


                                }

                          });
                        },
                        child: Text('Scan', style:TextStyle(
                          fontSize: 18.0

                        )),
                        color: Color(0xff39ff17),


                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Color(0xff39ff17)),

                        ),
                      ),

                      SizedBox(width: 40.0,),

                      RaisedButton(
                        elevation: 5.0,
                        padding: EdgeInsets.fromLTRB(60.0, 20.0, 60.0, 20.0),
                        onPressed: (){
                          setState(() {

                          });
                        },
                        child: Column(
                          children: [
                            Text('Check', style: TextStyle(
                              fontSize: 15.0,

                            )),
                            Text('Price', style: TextStyle(
                              fontSize: 15.0,

                            )),
                          ],
                        ),
                        color: Color(0xff39ff17),


                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Color(0xff39ff17)),

                        ),
                      )

                    ],
                  ),

                  Divider(
                    color: Colors.black,
                    thickness: 5.0,
                  ),

                  SizedBox(height: 15.0,),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Total: ', style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),),

                      Text(total.toString(), style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,

                      ),)

                    ],
                  ),
                  SizedBox(height: 29.0,),

                  RaisedButton(
                    elevation: 35.0,
                    padding: EdgeInsets.fromLTRB(120.0, 20.0, 120.0, 20.0),
                    onPressed: (){
                      setState(() {
                        Bar.points += 30;
                        items[0] = '';
                        items[1] = '';
                        items[2] = '';
                        Bar.balance = Bar.balance - total;
                        total = 0;

                      });
                    },
                    child: Column(
                      children: [

                        Text('Pay', style: TextStyle(
                          fontSize: 35.0,


                    ),),
                      ],
                    ),
                    color: Color(0xff39ff17),


                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Color(0xff39ff17)),

                    ),
                  )

                ],
              )
              ),
          ),
        ],
      ),

  );
  }
}



class Points extends StatefulWidget {
  @override
  _PointsState createState() => _PointsState();
}

class _PointsState extends State<Points> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff39ff17),
        title: Text("Redeem Points"),
        centerTitle: true,
      ),

      body: Column(
        children: [
          Container(

            margin: EdgeInsets.all(2),
            height: 310,
            width: 400,

            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),
                elevation: 2.0,
                child:ListView(
                  children: ListTile.divideTiles( //          <-- ListTile.divideTiles
                      context: context,
                      tiles: [
                        ListTile(
                          title: Text('SAVE 5% ON YOUR NEXT PURCHASE               250 Points',style: TextStyle(

                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                        ListTile(
                          title: Text('14% OFF ON ALL MEN FOOTWEAR                    400 Points',style: TextStyle(

                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                        ListTile(
                          title: Text('8.5% OFF ON ALL ELECTRONICS                       475 Points',style: TextStyle(

                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                        ListTile(
                          title: Text('BUY 2 GET 1 ON ALL FRUITS                              290 Points',style: TextStyle(

                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                        ListTile(
                          title: Text('10% CASHBACK ON YOUR NEXT MEAL           350 Points',style: TextStyle(

                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),

                      ]
                  ).toList(),
                )
            ),

          ),

        ],
      ),

    );
  }
}
