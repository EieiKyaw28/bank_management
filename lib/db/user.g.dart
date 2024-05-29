// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class BankUser extends $_BankUser
    with RealmEntity, RealmObjectBase, RealmObject {
  BankUser(
    ObjectId id,
    int amount,
    String userName,
    String password,
    String createDate,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'amount', amount);
    RealmObjectBase.set(this, 'userName', userName);
    RealmObjectBase.set(this, 'password', password);
    RealmObjectBase.set(this, 'createDate', createDate);
  }

  BankUser._();

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
  Stream<RealmObjectChanges<BankUser>> get changes =>
      RealmObjectBase.getChanges<BankUser>(this);

  @override
  BankUser freeze() => RealmObjectBase.freezeObject<BankUser>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(BankUser._);
    return const SchemaObject(ObjectType.realmObject, BankUser, 'BankUser', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('amount', RealmPropertyType.int),
      SchemaProperty('userName', RealmPropertyType.string),
      SchemaProperty('password', RealmPropertyType.string),
      SchemaProperty('createDate', RealmPropertyType.string),
    ]);
  }
}
