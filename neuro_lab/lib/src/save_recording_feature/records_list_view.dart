import 'package:flutter/material.dart';

class RecordListViewPage extends StatefulWidget {
  static const routeName = '/records-list';

  const RecordListViewPage({super.key});

  @override
  _RecordListViewPageState createState() => _RecordListViewPageState();
}

class _RecordListViewPageState extends State<RecordListViewPage> {
  List<bool> expandedItems = List.generate(20, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                expandedItems[index] = !expandedItems[index];
              });
            },
            child: Column(
              children: [
                ListTile(
                  title: Text('Item $index'),
                  trailing: IconButton(
                    icon: Icon(expandedItems[index]
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down),
                    onPressed: () {
                      setState(() {
                        expandedItems[index] = !expandedItems[index];
                      });
                    },
                  ),
                ),
                if (expandedItems[index])
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Expanded view of Item $index'),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
