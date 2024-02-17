void main() async {
  
  print('Start of program');
  
  try {
    final value = await httpGet('u');
    print(value);
  } on Exception catch(ex) {
    print('Error: $ex');
  } catch(e) {
    print(e);
  } finally {
    print('End of try/catch');
  }
  
  print('End of program');
  
}

Future<String> httpGet(String url) async {
  await Future.delayed(Duration(seconds: 1));
  
  if(url.isEmpty) {
    throw Exception('Invalid URL');
  }
  if(url.length < 2) {
    throw 'Invalid URL';
  }
  return 'Http response';
}

