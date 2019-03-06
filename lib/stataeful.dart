import 'package:flutter/material.dart';

void main() => runApp(new StatefulDemo());


class StatefulDemoState extends State<StatefulDemo>{
  int counter = 0;
  @override
  Widget build(BuildContext context){
    print('initial Counter : $counter');
    return new MaterialApp(
      title: 'Stateful Demo',
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text('Stateful Demo'),
          ),
          body: new Center(
            child: new Column(
              children: <Widget>[
                new Text('This is my first stateful demo $counter'),
                new MaterialButton(onPressed: (){
                  setState(() {
                    counter++;
                  });
                  print('clicked : $counter');
                },child: new Text('Click me'))
              ],
            )
            ,
          )
      ),
    );
  }
}

class StatefulDemo extends StatefulWidget{
  StatefulDemoState createState() => new StatefulDemoState();
}