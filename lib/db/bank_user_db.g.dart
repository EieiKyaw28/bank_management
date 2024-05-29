// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_user_db.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class BankUserDb extends $BankUserDb
    with RealmEntity, RealmObjectBase, RealmObject {
  BankUserDb(
    ObjectId id,
    int amount,
    String userName,
    String accName,
    String accNo,
    String password,
    String createDate,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'amount', amount);
    RealmObjectBase.set(this, 'userName', userName);
    RealmObjectBase.set(this, 'accName', accName);
    RealmObjectBase.set(this, 'accNo', accNo);
    RealmObjectBase.set(this, 'password', password);
    RealmObjectBase.set(this, 'createDate', createDate);
  }

  BankUserDb._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  int get amount => RealmObjectBase.get<int>(this, 'amount') as int;
  @override
  set amount(int value) => RealmObjectBase.set(this, 'amount', value);

  @override
  String get userName =>
      RealmObjectBase.get<String>(this, 'userName') as String;
  @override
  set userName(String value) => RealmObjectBase.set(this, 'userName', value);

  @override
  String get accName => RealmObjectBase.get<String>(this, 'accName') as String;
  @override
  set accName(String value) => RealmObjectBase.set(this, 'accName', value);

  @override
  String get accNo => RealmObjectBase.get<String>(this, 'accNo') as String;
  @override
  set accNo(String value) => RealmObjectBase.set(this, 'accNo', value);

  @override
  String get password =>
      RealmObjectBase.get<String>(this, 'password') as String;
  @override
  set password(String value) => RealmObjectBase.set(this, 'password', value);

  @override
  String get createDate =>
      RealmObjectBase.get<String>(this, 'createDate') as String;
  @override
  set createDate(String value) =>
      RealmObjectBase.set(this, 'createDate', value);

  @override
  Stream<RealmObjectChanges<BankUserDb>> get changes =>
      RealmObjectBase.getChanges<BankUserDb>(this);

  @override
  BankUserDb freeze() => RealmObjectBase.freezeObject<BankUserDb>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(BankUserDb._);
    return const SchemaObject(
        ObjectType.realmObject, BankUserDb, 'BankUserDb', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('amount', RealmPropertyType.int),
      SchemaProperty('userName', RealmPropertyType.string),
      SchemaProperty('accName', RealmPropertyType.string),
      SchemaProperty('accNo', RealmPropertyType.string),
      SchemaProperty('password', RealmPropertyType.string),
      SchemaProperty('createDate', RealmPropertyType.string),
    ]);
  }
}
