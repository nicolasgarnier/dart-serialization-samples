import 'package:serialization/serialization_mirrors.dart';
import 'dart:convert' show JSON;
@MirrorsUsed(symbols: "person", override: '*')
import 'dart:mirrors';

void main() {

  var serialization = new Serialization();

  Person jerome = new Person()
    ..id = 228
    ..name = "Jerome Dole"
    ..dateOfBirth = new DateTime(2013, 1, 19);

  Person sarah = new Person()
    ..id = 201
    ..name = "Sarah Dole"
    ..dateOfBirth = new DateTime(2011, 4, 9);

  Person bob = new Person()
    ..id = 123
    ..name = "Bob Dole"
    ..dateOfBirth = new DateTime(1980, 3, 16)
    ..children = (new List()..add(jerome)..add(sarah));

  Map personMap = serialization.write(bob);
  String personString = JSON.encode(personMap);

  print("Serialized Person: $personString");

  Person deserializedPerson = serialization.read(JSON.decode(personString));
  String allKidsName = deserializedPerson.children.fold("", (String concat, Person child) =>  "${child.name}, $concat");

  print("All Kids names: $allKidsName");
}

class Person {
  int id;
  String name;
  DateTime dateOfBirth;
  List<Person> children;
}
