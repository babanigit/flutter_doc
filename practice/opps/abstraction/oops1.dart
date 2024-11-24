// Abstraction in Dart can be implemented using abstract classes. Abstract classes cannot be instantiated and can have abstract methods.

abstract class Shape {
  double area(); // Abstract method
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);

  @override
  double area() {
    return 3.14 * radius * radius;
  }
}

void main() {
  Shape shape = Circle(10);
  print("Circle Area: ${shape.area()}");
}
