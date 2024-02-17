void main() {
  
  final Hero wolverine = Hero(name: 'Logan', power: 'Regeneración', isAlive: true);
  print( wolverine );
  
  final Hero ironman = Hero(
    name: 'Tony Stark', 
    power: 'Money', 
    isAlive: false
  );
  
  final Map<String, dynamic> rawJson = {
    'name': 'Spiderman',
    'power': 'Climb',
    'isAlive': true
  };
  print( Hero.fromJson(rawJson) );
}

class Hero {
  
  String name;
  String power;
  bool isAlive;
  
  
  Hero({
    required this.name, 
    required this.power,
    required this.isAlive 
    }
  );
  
  Hero.fromJson( Map<String, dynamic> json)
    : name = json['name'] ?? 'No name found',
      power = json['power'] ?? 'No power found',
      isAlive = json['isAlive'] ?? false;
  
  @override
  String toString() {
    return '$name - $power - isAlive: ${ isAlive ? 'YES!' : 'Nope'}';
  }
  
  
}