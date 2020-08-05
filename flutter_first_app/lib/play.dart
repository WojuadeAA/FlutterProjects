class Person {
  String name;
  int age;
//named Arguments
  Person({String Name, int Age}) {
    Name = name;
    Age = age;
  }
}

void main() {
  Person p1 = Person(Name: '', Age: 30);
}
