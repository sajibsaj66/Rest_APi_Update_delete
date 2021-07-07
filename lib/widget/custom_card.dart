import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Function upDateFunction;
  final String title;
  final Function deleteFunction;

  const CustomCard(
      {required this.upDateFunction,
      required this.title,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        child: Row(
          children: [
            IconButton(
                onPressed: () => upDateFunction(),
                icon: Icon(
                  Icons.edit,
                  color: Colors.red,
                )),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$title"),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () => deleteFunction(),
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
