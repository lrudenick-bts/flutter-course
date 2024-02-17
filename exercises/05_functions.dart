void main() {
  
  print( greetEveryone() );
  print( greetEveryoneSimple() );
  print( 'Suma: ${addTwoNumbers(10, 20)}');
  print( greetPerson(name: 'Polo', message: 'Hello'));
  
}

String greetEveryone() {
  return 'Hello everyone';
}

String greetEveryoneSimple() => 'Hello everyone';

int addTwoNumbers(int a, int b) => a + b;

int addTwoNumbersOpt(int a, [int b = 0]) {
  return a + b;
}


String greetPerson({required String name, String message = 'Hello, '}) {
  return '$message $name';
}