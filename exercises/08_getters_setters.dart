void main() {
  
  final Square square = Square(side: 5);
  print( square.calculateArea() );
  
  square.side = 6;
  print( square.area );
  square.side = 0;
}

class Square {
  double _side;
  
  Square({required double side} ): _side = side;
  
  double get area{
    return _side*_side;
  }
  
  double calculateArea() {
    return _side * _side;
  }
  
  set side( double value ) {
    print ('Setting new side value: $value');
    if(value <= 0) throw 'Value must be greater than 0';
    _side = value;
  }
}

