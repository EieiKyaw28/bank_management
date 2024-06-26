import 'package:realm/realm.dart';
part 'user.g.dart';

@RealmModel() 
class $BankUser {
  @PrimaryKey()
  late ObjectId id;

  late int amount;

  late String userName;

  late String accName;

  late String accNo;

  late String password;

  late String createDate;
}
