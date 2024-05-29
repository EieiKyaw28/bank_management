import 'package:realm/realm.dart';
part 'bank_user_db.g.dart';

@RealmModel()
class $BankUserDb {
  @PrimaryKey()
  late ObjectId id;

  late int amount;

  late String userName;

  late String accName;

  late String accNo;

  late String password;

  late String createDate;
}
