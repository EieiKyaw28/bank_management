import 'package:bank_management/constant/gap_const.dart';
import 'package:bank_management/constant/my_color.dart';
import 'package:bank_management/db/user.dart';
import 'package:bank_management/presentation/login_page.dart';
import 'package:bank_management/widget/new_card.dart';
import 'package:bank_management/widget/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';

class UserListPage extends ConsumerStatefulWidget {
  const UserListPage({super.key});

  @override
  ConsumerState<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends ConsumerState<UserListPage> {
  @override
  Widget build(BuildContext context) {
    final bankUser = ref.watch(bankuserProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColor.main,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            10.hGap,
            const Text(
              "User List",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                bankUser.when(data: (data) {
                  return Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return UserCard(userName: data[index].userName);
                        }),
                  );
                }, error: (e, st) {
                  return Text("$e");
                }, loading: () {
                  return SizedBox();
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
