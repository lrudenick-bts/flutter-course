mixin Walker {
  void walk() => print("I'm walking");
}

mixin Flyer {
  void fly() => print("I'm flying");
}

mixin Swimmer {
  void swim() => print("I'm swimming");
}

abstract class Animal {}
abstract class Mammal extends Animal {}
abstract class Bird extends Animal {}
abstract class Fish extends Animal {}

class Dolphin extends Mammal with Swimmer {}
class Bat extends Mammal with Flyer, Walker {}
class Cat extends Mammal with Walker {}

class Dove extends Bird with Flyer, Walker {}
class Duck extends Bird with Flyer, Walker, Swimmer {}

class Shark extends Fish with Swimmer {}
class FlyingFish extends Fish with Swimmer, Flyer {}

void main() {
  
  final Dolphin flipper = Dolphin();
  flipper.swim();
  
  final Bat batman = Bat();
  batman.fly();
  batman.walk();
  
  final Duck duck = Duck();
  duck.walk();
  duck.fly();
  duck.swim();
  
}

