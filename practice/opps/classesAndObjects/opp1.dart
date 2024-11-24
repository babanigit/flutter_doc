// In Dart, a class is a blueprint for creating objects, and an object is an instance of a class.

class Car {
  String brand;
  String model;

  // Constructor
  Car(this.brand, this.model);

  void displayInfo() {
    print("Car brand: $brand, Model: $model");
  }
}

void main() {
  // Object creation
  Car myCar = Car("Toyota", "Corolla");
  myCar.displayInfo();
}
