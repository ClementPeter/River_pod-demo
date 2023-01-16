import 'package:flutter_riverpod/flutter_riverpod.dart';

//creating a Provider to provide StremService to where its need in our app - Used to Demo StreamProvider in stream_provider_page.dart
final streamServiceProvider = Provider<StreamService>((ref)=>StreamService());

//Stream example to return a number after 1 sec
class StreamService{
  Stream getStream(){
    return Stream.periodic( const Duration(seconds: 1), (i) =>i).take(10);
  }
}