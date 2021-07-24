import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String? _dropDownText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        toolbarHeight: 100,
        elevation: 4,
        title: Row(
          children: [
            Text(
              "Dairy",
              style: TextStyle(fontSize: 40, color: Colors.blueGrey.shade400),
            ),
            Text(
              "Dairy",
              style: TextStyle(fontSize: 40, color: Colors.green.shade400),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  items: <String>["Latest", "Earlist"].map((String value) {
                    return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.greenAccent),
                        ));
                  }).toList(),
                  hint: (_dropDownText == null)
                      ? Text("Select")
                      : Text(_dropDownText!.toString()),
                  onChanged: (value) {
                    if (value == "Latest") {
                      setState(() {
                        _dropDownText = value.toString();
                      });
                    } else if (value == "Earlist") {
                      setState(() {
                        _dropDownText = value.toString();
                      });
                    }
                  },
                ),
              ),
              // TODO: create profile
              Container(
                  child: Row(
                children: [
                  Column(
                    children: [
                      Expanded(
                          child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                "https://st.depositphotos.com/1269204/1219/i/950/depositphotos_12196477-stock-photo-smiling-men-isolated-on-the.jpg"),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      )),
                      Text(
                        "Amit Dutta",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.login,
                        size: 19,
                        color: Colors.red,
                      ))
                ],
              ))
            ],
          )
        ],
      ),
      body: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border(
                        right: BorderSide(width: 0.4, color: Colors.blueGrey))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(38.0),
                      child: SfDateRangePicker(
                        onSelectionChanged: (dateRangePickerSelection) {
                          print(dateRangePickerSelection.value.toString());
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Card(
                        elevation: 4,
                        child: TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              size: 40,
                              color: Colors.greenAccent,
                            ),
                            label: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Write New",
                                  style: TextStyle(
                                      color: Colors.greenAccent, fontSize: 17),
                                ),
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                      child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Card(
                                elevation: 4,
                                child: ListTile(
                                  title: Text("Hello"),
                                ),
                              ),
                            );
                          }),
                    ))
                  ],
                ),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Add",
        child: Icon(Icons.add),
      ),
    );
  }
}
