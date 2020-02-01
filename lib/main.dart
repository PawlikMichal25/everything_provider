import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final notifier = PersonChangeNotifierProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Selector")),
      body: ChangeNotifierProvider.value(
        value: notifier,
        child: Column(
          children: [
            ProxyProvider<PersonChangeNotifierProvider, Person>(
              update: (context, value, previous) => value.person,
              child: PersonWidget(),
            ),
            FlatButton(
              onPressed: () {
                notifier.doMe();
              },
              child: Text("Click"),
            ),
          ],
        ),
      ),
    );
  }
}

class PersonChangeNotifierProvider extends ChangeNotifier {
  Person person = Person(Name("Michał", "Baran"), Address("city", "code"));

  void doMe() {
    person = Person(Name("Nowe", "Drugie"), Address("Takie", "Tam"));
    notifyListeners();
  }
}

class PersonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Selector<Person, Name>(
          selector: (context, person) => person.name,
          builder: (context, name, child) => NameWidget(name),
        ),
        Selector<Person, Address>(
          selector: (context, person) => person.address,
          builder: (context, address, child) => AddressWidget(address),
        ),
      ],
    );
  }
}

class NameWidget extends StatelessWidget {
  final Name name;

  NameWidget(this.name);

  @override
  Widget build(BuildContext context) {
    return Text("${name.lastName} ${name.firstName}");
  }
}

class AddressWidget extends StatelessWidget {
  final Address address;

  AddressWidget(this.address);

  @override
  Widget build(BuildContext context) {
    return Text("${address.city} ${address.code}");
  }
}

class Person {
  final Name name;
  final Address address;

  Person(this.name, this.address);
}

class Name {
  final String firstName;
  final String lastName;

  Name(this.firstName, this.lastName);
}

class Address {
  final String city;
  final String code;

  Address(this.city, this.code);
}
