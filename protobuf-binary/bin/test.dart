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

  print("Serialized Person as Buffer size: ${personBuffer.length}");

  Person deserializedPerson = new Person.fromBuffer(personBuffer);

  String allKidsName = deserializedPerson.children.fold("", (String concat, Person child) =>  "${child.name}, $concat");

  print("All Kids names: $allKidsName");

}
