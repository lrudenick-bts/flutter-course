void main() async {
  
  print('Start of program');
  
  try {
    final value = await httpGet('');
    print(value);
  } catch(e) {
    print(e);
  }
  
  print('End of program');
  
}

Future<String> httpGet(String url) async {
  await Future.delayed(Duration(seconds: 1));
  
  if(url.isEmpty) {
    throw Exception('Invalid URL');
  }
  return 'Http response';
}

