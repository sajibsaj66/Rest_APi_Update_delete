import 'package:flutter/material.dart';
import 'package:json_place_holder_albam/api_services.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({
    required this.id,
    required this.title,
  });
  final String id;
  final String title;

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final ApiService apiService = ApiService();
  late TextEditingController _textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    _textEditingController = TextEditingController(text: widget.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Update Screen ")),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                  labelText: "Task Title", hintText: "Enter Task Title"),
              autofocus: true,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  apiService.updateAlbam(widget.title, widget.id);
                },
                child: Text("Update"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
