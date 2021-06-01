import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vehicle_service_app/widgets/provider_widet.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController value1 = new TextEditingController();
  TextEditingController value2 = new TextEditingController();
  TextEditingController value3 = new TextEditingController();
  TextEditingController value4 = new TextEditingController();
  String selectedUser;
  String selectTime;
  String selectType;
  String formattedDate1;
  @override
  Widget build(BuildContext context) {
    var now = new DateTime.now();
    var date = new DateFormat('yyyy-MM-dd – HH:mm a');

    formattedDate1 = date.format(now);
    print(formattedDate1);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Vehicle Service'),
        ),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.all(32),
                    child: Form(
                      child: Column(children: [
                        TextField(
                          controller: value1,
                          decoration: InputDecoration(
                            labelText: "Vehicle Number",
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        new DropdownButton<String>(
                            hint: Text('Vehicle Type'),
                            dropdownColor: Colors.grey,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 36,
                            isExpanded: true,
                            items: <String>['CAR', 'VAN', 'BIKE', 'BUS']
                                .map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(
                                  value,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              );
                            }).toList(),
                            value: selectedUser,
                            onChanged: (newValue) {
                              setState(() {
                                selectedUser = newValue;
                              });
                            }),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          controller: value2,
                          decoration: InputDecoration(
                            labelText: "Vehicle Details",
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          controller: value3,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Mobile Number",
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          controller: value4,
                          decoration: InputDecoration(
                            labelText: "Note",
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: RawMaterialButton(
                            onPressed: () async {
                              final uid = await Provider.of(context)
                                  .auth
                                  .getCurrentUID();
                              final name = await Provider.of(context)
                                  .auth
                                  .getCurrentUser();

                              await Firestore.instance
                                  .collection("userData")
                                  .document(uid)
                                  .collection('Request')
                                  .add({
                                'title': value1.text,
                                'content': value2.text,
                                'currentUserEmail': name.email,
                                'note': value4.text,
                                'mNumber': value3.text,
                                'type': selectedUser,
                                'date': formattedDate1,
                              });

                              await Firestore.instance
                                  .collection("projects")
                                  .add({
                                'title': value1.text,
                                'content': value2.text,
                                'authorEmail': name.email,
                                'note': value4.text,
                                'mNumber': value3.text,
                                'type': selectedUser,
                                'authorId': name.uid,
                                'createdAt': Timestamp.now(),
                              });

                              await Firestore.instance
                                  .collection("notifications")
                                  .add({
                                'content': 'Added a new project',
                                'user': name.email,
                                'time': Timestamp.now(),
                              });
                            },
                            fillColor: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "Book",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
