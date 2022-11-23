import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feature_flags/data/firestore/fire_store_helper.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

import '../../data/remote_config/remote_config_helper.dart';
import '../../data/remote_config/remote_configs_key.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  late bool incrementButtonEnabled;
  late int incrementUnits;

  Stream<DocumentSnapshot<Map<String, dynamic>>> documentStream =
      FirebaseFirestore.instance.collection('app').doc('home').snapshots();

  @override
  void initState() {
    final remoteConfigHelper =
        RemoteConfigHelper(remoteConfig: FirebaseRemoteConfig.instance);

    incrementButtonEnabled = remoteConfigHelper.getBoolean(
        key: RemoteConfigKey.incrementButtonEnabled);
    incrementUnits =
        remoteConfigHelper.getInt(key: RemoteConfigKey.incrementUnits);

    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter += incrementUnits;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<Map<String, dynamic>>(
            stream:
                FireStoreHelper(firebaseFirestore: FirebaseFirestore.instance)
                    .getDocumentStream(colleciton: "app", document: "home"),
            builder: (context, snapshot) {
              final title = snapshot.data?['title'] ?? "Default";

              return Text(title);
            }),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementButtonEnabled ? _incrementCounter : null,
        backgroundColor: incrementButtonEnabled ? Colors.blue : Colors.grey,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
