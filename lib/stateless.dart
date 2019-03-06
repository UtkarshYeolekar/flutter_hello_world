import 'package:flutter/material.dart';

void main() => runApp(new StatelessDemo());

class StatelessDemo extends StatelessWidget{
  int counter = 0;
  @override
  Widget build(BuildContext context){
    print('initial Counter : $counter');
    return new MaterialApp(
        title: 'Stateless App',
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text('Stateless Demo'),
            ),
            body: new Center(
              child: new Column(
                children: <Widget>[
                  new Text('This is my first stateless demo $counter'),
                  new MaterialButton(onPressed: (){
                    counter++;
                    print('clicked : $counter');
                  },child: new Text('Click me'))
                ],
              )
              ,
            )
        )
    );
  }
}