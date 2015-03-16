// Copyright 2015 Google Inc
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// You may obtain a copy of the License at
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:dartson/dartson.dart';
import 'package:dartson/transformers/date_time.dart';

void main() {
  var dson = new Dartson.JSON();
  dson.addTransformer(new DateTimeParser(), DateTime);

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

  String personString = dson.encode(bob);

  print("Serialized Person: $personString");

  Person deserializedPerson = dson.decode(personString, new Person());
  String allKidsName = deserializedPerson.children.fold("", (String concat, Person child) => "${child.name}, $concat");

  print("All Kids names: $allKidsName");
}

@Entity()
class Person {
  int id;
  String name;
  DateTime dateOfBirth;
  List<Person> children;
}
