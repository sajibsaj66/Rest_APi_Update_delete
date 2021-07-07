import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_place_holder_albam/api_services.dart';
import 'package:json_place_holder_albam/widget/UpdateScreen.dart';
import 'package:json_place_holder_albam/widget/custom_card.dart';

import 'api_services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _titleEditController = TextEditingController();

  ApiService apiService = ApiService();

  var tasks = [];
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    tasks = await apiService.getAlbam();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(" Rest Api")),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                child: TextField(
                  controller: _titleEditController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your user name',
                      hintText: 'Enter Task Title'),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    var title = _titleEditController.text;
                    apiService.sendAlbam(title);
                  },
                  child: Text("Save"),
                ),
              ),
              ...tasks.map((task) {
                return CustomCard(
                  deleteFunction: () {
                    apiService.deleteAlbam(task["id"]);
                  },
                  title: task["title"],
                  // upDateFunction: () {},
                  upDateFunction: () {
                    Route route = MaterialPageRoute(builder: (_) {
                      return UpdateScreen(
                        title: task["title"],
                        id: task['id'].toString(),
                      );
                    });
                    Navigator.push(context, route);
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
