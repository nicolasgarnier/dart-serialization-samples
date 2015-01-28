import 'person.pb.dart';
import 'package:fixnum/fixnum.dart' show Int64;
import 'dart:typed_data' show Uint8List;

void main() {

  Person jerome = new Person()
    ..id = 228
    ..name = "Jerome Dole"
    ..dateOfBirth = new Int64(new DateTime(2013, 1, 19).millisecondsSinceEpoch);

  Person sarah = new Person()
    ..id = 201
    ..name = "Sarah Dole"
    ..dateOfBirth = new Int64(new DateTime(2011, 4, 9).millisecondsSinceEpoch);

  Person bob = new Person()
    ..id = 123
    ..name = "Bob Dole"
    ..dateOfBirth = new Int64(new DateTime(1980, 3, 16).millisecondsSinceEpoch)
    ..children.add(jerome)
    ..children.add(sarah);

  Uint8List personBuffer = bob.writeToBuffer();
  String personBufferString = new String.fromCharCodes(personBuffer);

  print("Serialized Person as Buffer: $personBufferString");

  String personJson = bob.writeToJson();

  print("Serialized Person as JSON: $personJson");

  Person deserializedPerson = new Person.fromBuffer(personBuffer);

  String allKidsName = deserializedPerson.children.fold("", (String concat, Person child) =>  "${child.name}, $concat");

  print("All Kids names: $allKidsName");

}
