import 'dart:io';

// Define an interface
abstract class Animal {
  void makeSound();
}

// Define a base class implementing the interface
class AnimalBase implements Animal {
  @override
  void makeSound() {
    print('Animal makes a sound');
  }
}

// Define a derived class that overrides the makeSound method
class Dog extends AnimalBase {
  @override
  void makeSound() {
    print('Dog barks');
  }
}

// Define a class to represent a Person
class Person {
  late String name;
  late int age;

  // Constructor to initialize data from a file
  Person.fromFile(String filePath) {
    // Open the file
    File file = File(filePath);

    // Read the contents of the file
    List<String> lines = file.readAsLinesSync();

    // Extract name and age from the file
    name = lines[0];
    age = int.parse(lines[1]);
  }

  // Method to display person's information
  void displayInfo() {
    print('Name: $name');
    print('Age: $age');
  }
}

// Method demonstrating the use of a loop
void printNumbers() {
  for (int i = 1; i <= 5; i++) {
    print('Number: $i');
  }
}

void main() {
  // Create an instance of Dog
  Dog dog = Dog();
  // Call makeSound method
  dog.makeSound();

  // Initialize a person object from a file
  Person person = Person.fromFile('person.txt');
  // Display person's information
  person.displayInfo();

  // Demonstrate the use of a loop
  printNumbers();
}
