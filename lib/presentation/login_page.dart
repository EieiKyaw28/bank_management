import 'dart:async';
import 'dart:developer';

import 'package:bank_management/constant/gap_const.dart';
import 'package:bank_management/constant/my_color.dart';
import 'package:bank_management/db/user.dart';
import 'package:bank_management/domain/bank_user_model.dart';
import 'package:bank_management/presentation/user_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:realm/realm.dart';

final realmProvider = Provider<Realm>((ref) {
  var config = Configuration.local([BankUser.schema]);
  return Realm(config);
});

final bankuserProvider = StreamProvider<List<BankUser>>((ref) {
  final realm = ref.watch(realmProvider);
  final tasks = realm.all<BankUser>();
  //

  final controller = StreamController<List<BankUser>>.broadcast();

  final subscription = tasks.changes.listen((changes) {
    final updatedTasks = tasks.toList();
    controller.add(updatedTasks);
  });

  ref.onDispose(() {
    controller.close();
    subscription.cancel();
  });

  // Add the initial data to the stream
  controller.add(tasks.toList());

  return controller.stream;
});

Stream<List<BankUser>> dataStream(BankUser data) async* {
  List<BankUser> counterList = [];

  while (true) {
    await Future.delayed(Duration(seconds: 1));
    counterList.add(data);
    yield counterList.toList();
  }
}

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  // CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime initialDate = DateTime.now();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

  late Realm realm;
  int id = 0;
  String name = "";
  String chooseDate = "Date Picker";
  //DateTime _selectedDay;
  FocusNode myFocusNodeName = new FocusNode();
  FocusNode myFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    var config = Configuration.local([BankUser.schema]);

    var realm = Realm(config);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColor.main,
          title: Text(
            "Create Your Account",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Material(
                    //  height: 200,

                    borderRadius: BorderRadius.circular(5),
                    elevation: 2,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            width: 250,
                            child: TextFormField(
                              cursorColor: MyColor.main,
                              focusNode: myFocusNodeName,
                              controller: userNameController,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.black),
                              onChanged: (val) {},
                              decoration: InputDecoration(
                                  labelText: "User Name",
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: BorderSide(color: MyColor.main),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: BorderSide(color: MyColor.main),
                                  ),
                                  labelStyle: TextStyle(
                                      color: myFocusNodeName.hasFocus
                                          ? MyColor.main
                                          : Colors.black)

                                  //fillColor: Colors.green
                                  ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            width: 250,
                            child: TextFormField(
                              cursorColor: MyColor.main,
                              focusNode: myFocusNode,
                              controller: pwController,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.black),
                              onChanged: (val) {},
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: BorderSide(color: MyColor.main),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: BorderSide(color: MyColor.main),
                                  ),
                                  labelStyle: TextStyle(
                                      color: myFocusNode.hasFocus
                                          ? MyColor.main
                                          : Colors.black)

                                  //fillColor: Colors.green
                                  ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    name = userNameController.text;
                                  });
                                  log("Name = $name");
                                  DateTime now = DateTime.now();
                                  String formattedDateTime =
                                      DateFormat('yyyy-MM-dd | HH:mm:ss a')
                                          .format(now);

                                  var item = BankUser(
                                      ObjectId(),
                                      0,
                                      userNameController.text,
                                      pwController.text,
                                      "");
                                  realm.write(() {
                                    realm.add(item);
                                  });
                                  dataStream(item);
                                  setState(() {});
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const UserListPage();
                                  }));
                                  userNameController.clear();
                                  pwController.clear();
                                },
                                child: Material(
                                  borderRadius: BorderRadius.circular(5),
                                  elevation: 2,
                                  child: SizedBox(
                                      height: 50,
                                      width: 200,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: MyColor.main,
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        child: Center(
                                            child: Text(
                                          "Create",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        )),
                                      )),
                                ),
                              )

                              // TableCalendar(focusedDay: _focusedDay, firstDay: firstDay, lastDay: lastDay)
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              15.vGap,
              // Text(
              //   "Date",
              //   style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 16,
              //       fontWeight: FontWeight.bold),
              // ),
              // 10.vGap,
              // InkWell(
              //   onTap: () async {
              //     final DateTime? dateTime = await showDatePicker(
              //         context: context,
              //         initialDate: initialDate,
              //         firstDate: DateTime(2000),
              //         lastDate: DateTime(3000));
              //     if (dateTime != null) {
              //       setState(() {
              //         initialDate = dateTime;
              //         chooseDate = dateTime.day.toString() +
              //             "." +
              //             dateTime.month.toString() +
              //             "." +
              //             dateTime.year.toString();
              //       });
              //     }
              //   },
              //   child: Container(
              //     height: 50,
              //     width: MediaQuery.of(context).size.width,
              //     decoration: BoxDecoration(
              //         border: Border.all(
              //             width: 1, color: Colors.black.withOpacity(.5)),
              //         borderRadius: BorderRadius.circular(13)),
              //     child: Padding(
              //       padding: const EdgeInsets.all(10.0),
              //       child: Text(chooseDate),
              //     ),
              //   ),
              // ),
            ],
          ),
        ));
  }
}
