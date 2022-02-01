import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

const title = 'FloatingActionButton Demo';
const useMaterial = true;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return useMaterial
        ? MaterialApp(
            title: 'FloatingActionButtton Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const Home(),
          )
        : CupertinoApp(
            color: CupertinoColors.systemOrange,
            home: const Home(),
            title: title,
          );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var fab = FloatingActionButton(
    backgroundColor: Colors.red,
    child: Icon(Icons.ac_unit),
    foregroundColor: Colors.yellow,
    onPressed: () => print('got press'),
  );
  /*
  var fab = FloatingActionButton.extended(
    backgroundColor: Colors.red,
    icon: Icon(Icons.ac_unit), // for extended
    foregroundColor: Colors.yellow,
    isExtended: true,
    label: Text('Shiver!'), // for extended
    onPressed: () => print('got press'),
  );
  */

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('Add content here.'),
        ],
      ),
    );
  }

  Widget _buildCupertinoScaffold() {
    return CupertinoPageScaffold(
      child: Scaffold(
        body: _buildBody(),
        floatingActionButton: fab,
      ),
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBlue,
        middle: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildMaterialScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _buildBody(),
      floatingActionButton: fab,
      //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  @override
  Widget build(BuildContext context) {
    return useMaterial ? _buildMaterialScaffold() : _buildCupertinoScaffold();
  }
}
