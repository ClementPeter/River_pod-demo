import 'package:flutter_riverpod/flutter_riverpod.dart';

//creating a Provider to provide StremService to where its need in our app
final streamServiceProvider = Provider<StreamService>((ref)=>StreamService());

//Stream example to return a number after 1 sec
class StreamService{
  Stream getStream(){
    return Stream.periodic( const Duration(seconds: 1), (i) =>i).take(10);
  }
}