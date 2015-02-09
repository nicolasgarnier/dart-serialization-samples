///
//  Generated code. Do not modify.
///
library person;

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart';

class Person extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('Person')
    ..a(1, 'id', GeneratedMessage.Q3)
    ..a(2, 'name', GeneratedMessage.QS)
    ..a(3, 'dateOfBirth', GeneratedMessage.QU6, () => makeLongInt(0))
    ..m(4, 'children', () => new Person(), () => new PbList<Person>())
  ;

  Person() : super();
  Person.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Person.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Person clone() => new Person()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;

  int get id => getField(1);
  void set id(int v) { setField(1, v); }
  bool hasId() => hasField(1);
  void clearId() => clearField(1);

  String get name => getField(2);
  void set name(String v) { setField(2, v); }
  bool hasName() => hasField(2);
  void clearName() => clearField(2);

  Int64 get dateOfBirth => getField(3);
  void set dateOfBirth(Int64 v) { setField(3, v); }
  bool hasDateOfBirth() => hasField(3);
  void clearDateOfBirth() => clearField(3);

  List<Person> get children => getField(4);
}

