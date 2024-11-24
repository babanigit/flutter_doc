// Polymorphism allows the same method to behave differently based on the object.

class Shape {
  double area() {
    return 0;
  }
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double area() {
    return 3.14 * radius * radius;
  }
}

class Rectangle extends Shape {
  double length, breadth;

  Rectangle(this.length, this.breadth);

  @override
  double area() {
    return length * breadth;
  }
}

void main() {
  Shape shape;

  shape = Circle(10);
  print("Circle Area: ${shape.area()}");

  shape = Rectangle(5, 4);
  print("Rectangle Area: ${shape.area()}");
}
