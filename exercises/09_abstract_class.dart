void main() {
  
  final EnergyPlant windPlant = WindPlant(initialEnergy: 100);
  print(windPlant.energyLeft);
  print('wind: ${chargePhone(windPlant)}');
  
  final nuclearPlant = NuclearPlant(energyLeft: 300);
  print('nuclear: ${chargePhone(nuclearPlant)}');
  
}

double chargePhone(EnergyPlant plant) {
  if(plant.energyLeft < 10) {
    throw Exception('Not enough energy');
  }
  return plant.energyLeft -10;
}

enum PlantType { nuclear, wind, water, solar}

abstract class EnergyPlant {
  
  double energyLeft;
  final PlantType type;
  
  EnergyPlant({
    required this.energyLeft,
    required this.type
  });
  
  void consumeEnergy(double amount);
  
}

class WindPlant extends EnergyPlant {
  
  WindPlant({
    required double initialEnergy
  }) : super(energyLeft: initialEnergy, type: PlantType.wind);
  
  @override
  void consumeEnergy(double amount) {
    energyLeft -= amount;
  }
}


class NuclearPlant implements EnergyPlant {
  
  @override
  double energyLeft;
  
  @override
  final PlantType type = PlantType.nuclear;
  
  NuclearPlant({
    required this.energyLeft
  });
  
  @override
  void consumeEnergy(double amount) {
    energyLeft -= amount *.5;
  }
}

