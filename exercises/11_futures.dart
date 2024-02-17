void main() {
  
  print('Start of program');
  httpGet('').then((value){
    print(value);
  }).catchError((e) {
    print(e);
  });
  print('End of program');
  
}

Future<String> httpGet(String url) {
  return Future.delayed(Duration(seconds: 1), () {
    if(url.isEmpty) {
      throw Exception("Invalid URL");
    }
     return 'Http response';
  });
}

