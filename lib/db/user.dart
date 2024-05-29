import 'package:realm/realm.dart';
part 'user.g.dart';

@RealmModel() // define a data model class named `_Car`.
class $_BankUser {
  @PrimaryKey()
  late ObjectId id;

  late int amount;

  late String userName;

  late String password;

  late String createDate;
}
