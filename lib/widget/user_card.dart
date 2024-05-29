// import 'package:bank_management/constant/my_color.dart';
// import 'package:flutter/material.dart';

// class UserCard extends StatelessWidget {
//   const UserCard({
//     super.key,
//     required this.userName,
//   });
//   final String userName;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(
//                     width: 1,
//                     color: MyColor.main,
//                   ),
//                   borderRadius: BorderRadius.circular(6)),
//               child: Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Text(userName),
//               ),
//             ),
//             // Container(
//             //   height: 10,
//             //   width: MediaQuery.of(context).size.width,
//             //   decoration: BoxDecoration(
//             //       color: MyColor.main,
//             //       border: Border.all(
//             //         width: 1,
//             //         color: MyColor.main,
//             //       ),
//             //       borderRadius: BorderRadius.only(
//             //           bottomLeft: Radius.circular(5),
//             //           bottomRight: Radius.circular(5))),
//             //   child: Padding(
//             //     padding: const EdgeInsets.all(15.0),
//             //     child: Text(userName),
//             //   ),
//             // )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:bank_management/constant/gap_const.dart';
import 'package:bank_management/constant/my_color.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.userName,
  });
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      shadowColor: MyColor.main,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: MyColor.main.withOpacity(.3)),
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: MyColor.main,
                  size: 24,
                ),
                10.hGap,
                Text(
                  userName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
